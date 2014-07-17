class SectionField < ActiveRecord::Base
    belongs_to :section_type
<<<<<<< HEAD
    has_many :section_text_items
=======
    has_one :section_text_item
>>>>>>> aebf6910fde7b673bf09dccd86fc66a5fc152d54
end
