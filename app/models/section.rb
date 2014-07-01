class Section < ActiveRecord::Base
    belongs_to :user
    belongs_to :section_type
    has_many :section_items, dependent: :destroy

    after_save :do_after_save
    
    def do_after_save
    	if self.section_type.id == 1
        	SectionItem.create(
                    section_id: id)
    	end
    end
end
