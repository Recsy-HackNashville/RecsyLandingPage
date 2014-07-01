class SectionTextItem < ActiveRecord::Base
    belongs_to :section_item
    has_one :section_field
end
