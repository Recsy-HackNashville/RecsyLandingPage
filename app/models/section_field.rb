class SectionField < ActiveRecord::Base
    belongs_to :section_type
    has_many :section_text_items
end
