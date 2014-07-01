class BuilderController < ApplicationController
        require 'net/http'
        require 'net/https'
        require 'uri'
        require 'json'
        require 'open-uri'


    def initialize
        super
        @publicPath = Rails.root.join('public')
    end

    def index
        
        @sectionTypes = SectionType.all
        @sections = Section.where(user_id: current_user.id)
        @headline = current_user.headline
        @current_user = User.where(id: current_user.id).first
    end

    def view
        @current_user = User.where(id: current_user.id).first
        @name = @current_user.name.gsub(/\s+/, "")
        @myId = current_user.id
        # Tells the template how to reach its resources
        # The template should be using this for every http request
        @path = '/templates/zach'
        @homeSection = Section.where(user_id: current_user.id).where(section_type_id: 1).first
        @educationSection = Section.where(user_id: current_user.id).where(section_type_id: 5).first
        @experienceSection = Section.where(user_id: current_user.id).where(section_type_id: 2).first
        @sections = Section.order("id ASC").where(user_id: current_user.id)
        @nameField = { text: current_user.name }
        @phoneNumberField = { text: '' }
        @emailField = { text: '' }
        @tagline1Field = { text: current_user.headline }
        @tagline2Field = { text: current_user.location_name }
        @tagline3Field = { text: '' }
        @linkedInField = { text: '' }
        @githubField = { text: '' }
        @blogField = { text: '' }
        unless current_user.picture_url
            @picture_url = @path + "/img/face.png"
        else
            @picture_url = current_user.picture_url
        end
        begin
            @nameField = { text: current_user.name }
            @phoneNumberField = @homeSection.section_text_items.where(section_field_id: 2).first
            @emailField = @homeSection.section_text_items.where(section_field_id: 3).first
            @tagline1Field = { text: current_user.headline }
            @tagline2Field = { text: current_user.location_name }
            @tagline3Field = @homeSection.section_text_items.where(section_field_id: 6).first
            @linkedInField = @homeSection.section_text_items.where(section_field_id: 7).first
            @githubField = @homeSection.section_text_items.where(section_field_id: 8).first
            @blogField = @homeSection.section_text_items.where(section_field_id: 9).first
            @picture_url = { text: current_user.picture_url}
        rescue
        end
        render "#{@publicPath.to_s}/#{@path}/#{@name}#{@myId}.html.erb", layout: false
        
    end

    def viewParam
        @idParam = params[:id]
        @current_user = User.where(id: @idParam).first
        @name = @current_user.name.gsub(/\s+/, "")
        @myId = @idParam
        # Tells the template how to reach its resources
        # The template should be using this for every http request
        @path = '/templates/zach'
        @homeSection = Section.where(user_id: @idParam).where(section_type_id: 1).first
        @educationSection = Section.where(user_id: @idParam).where(section_type_id: 5).first
        @experienceSection = Section.where(user_id: @idParam).where(section_type_id: 2).first
        @sections = Section.order("id ASC").where(user_id: @idParam)
        @nameField = { text: @current_user.name }
        @phoneNumberField = { text: '' }
        @emailField = { text: '' }
        @tagline1Field = { text: @current_user.headline }
        @tagline2Field = { text: @current_user.location_name }
        @tagline3Field = { text: '' }
        @linkedInField = { text: '' }
        @githubField = { text: '' }
        @blogField = { text: '' }
        unless @current_user.picture_url
            @picture_url = @path + "/img/face.png"
        else
            @picture_url = @current_user.picture_url
        end
        begin
            @nameField = { text: @current_user.name }
            @phoneNumberField = @homeSection.section_text_items.where(section_field_id: 2).first
            @emailField = @homeSection.section_text_items.where(section_field_id: 3).first
            @tagline1Field = { text: @current_user.headline }
            @tagline2Field = { text: @current_user.location_name }
            @tagline3Field = @homeSection.section_text_items.where(section_field_id: 6).first
            @linkedInField = @homeSection.section_text_items.where(section_field_id: 7).first
            @githubField = @homeSection.section_text_items.where(section_field_id: 8).first
            @blogField = @homeSection.section_text_items.where(section_field_id: 9).first
            @picture_url = { text: @current_user.picture_url}
        rescue
        end
        render "#{@publicPath.to_s}/#{@path}/#{@name}#{@myId}.html.erb", layout: false
    end

    def update
        flash[:notice] = "Updated"

    end
end
