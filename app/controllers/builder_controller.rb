class BuilderController < ApplicationController
    def initialize
        super
        @publicPath = Rails.root.join('public')
    end

    def index
        @sectionTypes = SectionType.all
        @sections = Section.where(user_id: current_user.id)
    end

    def view
        # Tells the template how to reach its resources
        # The template should be using this for every http request
        @path = '/templates/zach'
        @homeSection = Section.where(user_id: current_user.id).first
        @nameField = { text: '' }
        @addressField = { text: '' }
        begin
            @nameField = @homeSection.section_text_items.first
            @addressField = @homeSection.section_text_items[1]
        rescue
        end
        render "#{@publicPath.to_s}/#{@path}/index.html.erb", layout: false
    end

    def update
        flash[:notice] = "Updated"

    end
end
