class RemoveSectionIdFromSectionTextItems < ActiveRecord::Migration
  def change
  	remove_column :section_text_items, :section_id, :integer
  end
end
