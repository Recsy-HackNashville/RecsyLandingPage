class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :rememberable, :trackable, :omniauthable
    has_many :sections, dependent: :destroy

def jekyll_site
      if not @site
        # Supress stdout
        original_stdout = $stdout
        $stdout = File.new('/tmp/null.txt', 'w')

        config  = Jekyll.configuration({'source' => cloned_repo_path})
        @site   = Jekyll::Site.new(config)
        @site.read

        $stdout = original_stdout
      end

      @site
    end

    def git_opts
      {:raise=>true, :timeout=>false, :chdir => cloned_repo_path}
    end

    def app_base
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end

    def push_to_origin(repo)
      if ENV['PUSH_VIA_QUEUE']
        PushCommitWorker.perform_async
      else
        repo.git.push(git_opts, ["origin"])
      end
    end

    def cloned_repo_path
      "#{app_base}/tmp/repo"
    end

    def clone_repo
      set_ssh_access()

      if not File.directory? cloned_repo_path
        grit = Grit::Git.new(cloned_repo_path)
        grit.clone({:quiet => false, :verbose => true, :progress => true}, settings.repo_src, cloned_repo_path)
      end
    end

    # Grit repo instance
    def repo
      @repo ||= Grit::Repo.new(cloned_repo_path) 
      Dir.chdir(cloned_repo_path)

      @repo
    end

    # Shortcut for checking whether the post exists
    def post_exists?(post_file)
      File.exists? post_path(post_file)
    end

    # Expanded post path of the post file
    def post_path(post_file)
      File.join(jekyll_site.source, *%w[_posts], post_file)
    end

    def default_yaml
      defaults_file = File.join(jekyll_site.source, '_default.yml')
      defaults  = {}
      if File.exists? defaults_file
        defaults = YAML::load(File.read(defaults_file))
      end

      defaults
    end

    # Jekyll instance of post file
    def jekyll_post(post_file)
      Jekyll::Post.new(jekyll_site, jekyll_site.source, '', post_file)
    end

    # Gives out a sorted list of post template data
    # for a post or draft
    def posts_template_data(post_items)
      if post_items.nil?
        return []
      end

      template_data = post_items.map do |post|
        {
          :title    => post.data['title'],
          :filename => post.name,
          :date     => post.date
        }
      end

      template_data.sort! { |x,y| y[:date] <=> x[:date] }

      template_data
    end

    def set_ssh_access

      base = ENV['HOME']

      if ENV.has_key? 'SSH_PRIVATE_KEY' and 
        (not File.exists? "#{base}/.ssh/id_rsa") and
        ENV['RACK_ENV'] == 'production'

        FileUtils.mkdir_p "#{base}/.ssh/"
        f = File.new "#{base}/.ssh/id_rsa", 'w+'
        f.write ENV['SSH_PRIVATE_KEY']
        f.chmod(0600)
        f.close
        FileUtils.chmod 0700, "#{base}/.ssh"

        ssh_config = <<CONF
StrictHostKeyChecking no
UserKnownHostsFile /dev/null
CONF
        File.open("#{base}/.ssh/config", 'w+') { |f| f.write ssh_config }
      end

      if not File.exists? "#{base}/.gitconfig"
        git_config = <<CONF
[user]
  name = Pagoda Admin
  email = alagu@alagu.net
CONF
        File.open("#{base}/.gitconfig", 'w+') { |f| f.write git_config }
      end
    end


    def self.connect_to_linkedin(auth, signed_in_resource = nil)
        
        require 'linkedin'

        user = User.where(provider: auth.provider, uid: auth.uid).first
        if user
            return user
        else
            registered_user = User.where(email: auth.info.email).first
            if registered_user
                return registered_user
            else
                
                puts "[INFO] Creating user"
                puts auth.to_yaml
                puts "raw auth"
                puts auth
                client = LinkedIn::Client.new("751q1szfwv7d4g", "dOWeo52OovVuZSjI")
                client.authorize_from_access(auth.credentials.token, auth.credentials.secret)
                user_positions = client.profile(:fields => %w(positions))
                clientPictureUrl = client.picture_urls.all.first
                puts "clientPictureUrl"
                puts clientPictureUrl
                User.create(
                    name: auth.info.name,
                    provider: auth.provider,
                    uid: auth.uid,
                    email: auth.info.email,
                    password: Devise.friendly_token[0, 20],
                    headline: auth.info.headline,
                    location_name: auth.info.location,
                    picture_url: clientPictureUrl
                )
                currentUser = User.where(email: auth.info.email).first
                currentUserId = currentUser.id
                puts "dataaaa"
                puts user_positions
                if user_positions['positions']['total'].to_i > 0
                    #creates an experience section
                    Section.create(
                        section_type_id: 2,
                        user_id: currentUserId
                    )
                    user_positions['positions']['all'].each do |position|
                        currentExperienceSectionId = Section.where(section_type_id: 2, user_id: currentUserId).first.id
                        exp_section_item = SectionItem.create(
                            section_id: currentExperienceSectionId)
                        titleTextItem = SectionTextItem.where(section_field_id: 10, section_item_id: exp_section_item.id ).first
                        titleTextItem.text = position['title']
                        titleTextItem.save
                        companyTextItem = SectionTextItem.where(section_field_id: 11, section_item_id: exp_section_item.id ).first
                        companyTextItem.text = position['company']['name']
                        companyTextItem.save
                        startDateTextItem = SectionTextItem.where(section_field_id: 12, section_item_id: exp_section_item.id ).first
                        startDateTextItem.text = Date.strptime("#{position['start_date']['month']}/#{position['start_date']['year']}", '%m/%Y')
                        startDateTextItem.save
                        endDateTextItem = SectionTextItem.where(section_field_id: 13, section_item_id: exp_section_item.id ).first
                        endDateTextItem.text = (Date.strptime("#{position['end_date']['month']}/#{position['end_date']['year']}", '%m/%Y') rescue nil)
                        endDateTextItem.save
                        descriptionTextItem = SectionTextItem.where(section_field_id: 14, section_item_id: exp_section_item.id ).first
                        descriptionTextItem.text = position['summary']
                        descriptionTextItem.save
                        puts "company stuff"
                        coID = position['company']['id']
                        if coID
                            company_data = client.company(:id => coID, :fields=>["universal-name","email-domains","company-type","ticker","website-url","industries","status","logo-url","square-logo-url","blog-rss-url","twitter-id","employee-count-range","specialties","locations","description","stock-exchange","founded-year","end-year","num-followers"])
                            puts "company data"
                            puts company_data
                            logoURLTextItem = SectionTextItem.where(section_field_id: 30, section_item_id: exp_section_item.id ).first
                            logoURLTextItem.text = company_data['logo_url']
                            logoURLTextItem.save
                        else
                            puts "nooo coid"
                        end
                    end
                end
                clientProjects = client.profile(:fields => %w(projects))
                puts "client projects plz"
                puts clientProjects
                if clientProjects['projects']['total'].to_i > 0
                    #creates an experience section
                    Section.create(
                        section_type_id: 3,
                        user_id: currentUserId
                    )
                    clientProjects['projects']['all'].each do |project|
                        currentSectionId = Section.where(section_type_id: 3, user_id: currentUserId).first.id
                        pro_section_item = SectionItem.create(
                            section_id: currentSectionId)
                        nameTextItem = SectionTextItem.where(section_field_id: 15, section_item_id: pro_section_item.id ).first
                        nameTextItem.text = project['name']
                        nameTextItem.save
                        urlTextItem = SectionTextItem.where(section_field_id: 16, section_item_id: pro_section_item.id ).first
                        urlTextItem.text = project['url']
                        urlTextItem.save
                        descriptionTextItem = SectionTextItem.where(section_field_id: 17, section_item_id: pro_section_item.id ).first
                        descriptionTextItem.text = project['description']
                        descriptionTextItem.save
                        
                    end
                end
                currentContactSection = Section.create(section_type_id: 4, user_id: currentUserId)
                contact_section_item = SectionItem.create(section_id: currentContactSection.id)
                if currentUser.email
                    emailTextItem = SectionTextItem.where(section_field_id: 18, section_item_id: contact_section_item.id).first
                    emailTextItem.text = currentUser.email
                    emailTextItem.save
                end
                if auth.info.urls.public_profile
                    puts "public profile url"
                    puts auth.info.urls.public_profile
                    profileUrlTextItem = SectionTextItem.where(section_field_id: 20, section_item_id: contact_section_item.id).first
                    profileUrlTextItem.text = auth.info.urls.public_profile
                    profileUrlTextItem.save
                end
                clientEducation = client.profile(:fields => %w(educations))
                puts "education"
                puts clientEducation
                if clientEducation['educations']['total'].to_i > 0
                    #creates an education section
                    Section.create(
                        section_type_id: 5,
                        user_id: currentUserId
                    )
                    clientEducation['educations']['all'].each do |education|
                        currentSectionId = Section.where(section_type_id: 5, user_id: currentUserId).first.id
                        edu_section_item = SectionItem.create(
                            section_id: currentSectionId)
                        textItem = SectionTextItem.where(section_field_id: 22, section_item_id: edu_section_item.id ).first
                        textItem.text = education['school_name']
                        textItem.save
                        textItem2 = SectionTextItem.where(section_field_id: 23, section_item_id: edu_section_item.id ).first
                        textItem2.text = education['degree']
                        textItem2.save
                        textItem3 = SectionTextItem.where(section_field_id: 24, section_item_id: edu_section_item.id ).first
                        textItem3.text = education['field_of_study']
                        textItem3.save
                        textItem4 = SectionTextItem.where(section_field_id: 25, section_item_id: edu_section_item.id ).first
                        textItem4.text = education['start_date']['year']
                        textItem4.save
                        textItem5 = SectionTextItem.where(section_field_id: 26, section_item_id: edu_section_item.id ).first
                        textItem5.text = education['end_date']['year']
                        textItem5.save
                    end
                end
                #puts "auth info"
                #puts auth.info
                #puts "auth raw_info"
                #puts auth.raw_info
                #puts "three past positions?"
                #puts auth.info.positions
                #puts "maybe??"
                #puts auth.extra.raw_info.threePastPositions.values.map { |n| n.first.company.name if n.kind_of?(Array) }.compact
                puts "hmm maybe"
                puts auth.extra.raw_info.threePastPositions

                post_title = currentUser.name
                post_date = (Time.now).strftime("%Y-%m-%d")
                defaults = { 'title' => post_title,
                        'layout' => 'post',
                        'published' => false }
                content    = defaults.to_yaml + "---\n"
                post_file  = (post_date + "-" + post_title) + '.md'
                #File.open ("#{RAILS_ROOT}/public/r/mytest1.html", 'w+') do |f|
                #    f.write("blah")
                #end
                @userName = currentUser.name.gsub(/\s+/, "")
                @userId = currentUser.id
                templateFile = File.read("public/templates/zach/index.html.erb")
                puts templateFile
                File.open("public/templates/zach/#{@userName}#{@userId}.html.erb",'w+') do |fileb|
                    fileb.write(templateFile)
                end


                return User.where(email: auth.info.email).first
            end
        end
    end  
end
