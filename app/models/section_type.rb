class SectionType < ActiveRecord::Base
   has_one :section 
   has_many :section_fields
end
