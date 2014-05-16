class SectionField < ActiveRecord::Base
    belongs_to :section_type
    has_one :section_text_item
end
