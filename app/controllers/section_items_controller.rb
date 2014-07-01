class SectionItemsController < ApplicationController
    def create
        sectionId = SectionItem.new(params[:section_id])
        sectionItem = Section.new(
                    section_id: sectionId
                )
        sectionItem.save
        redirect_to controller: :builder, action: :index
    end

    def destroy
    end

end
