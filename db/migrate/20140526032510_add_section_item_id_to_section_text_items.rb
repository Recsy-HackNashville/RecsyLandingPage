class AddSectionItemIdToSectionTextItems < ActiveRecord::Migration
  def change
    add_column :section_text_items, :section_item_id, :integer
  end
end
