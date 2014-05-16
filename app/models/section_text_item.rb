class SectionTextItem < ActiveRecord::Base
    belongs_to :section
    has_one :section_field
end
