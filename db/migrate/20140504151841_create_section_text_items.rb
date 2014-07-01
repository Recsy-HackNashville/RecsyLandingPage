class CreateSectionTextItems < ActiveRecord::Migration
  def change
    create_table :section_text_items do |t|
      t.integer :section_id
      t.integer :section_field_id
      t.text :text

      t.timestamps
    end
  end
end
