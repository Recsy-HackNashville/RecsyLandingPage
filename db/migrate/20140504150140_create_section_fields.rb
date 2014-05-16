class CreateSectionFields < ActiveRecord::Migration
  def change
    create_table :section_fields do |t|
      t.integer :section_type_id
      t.string :field_table_name
      t.string :label
    end
  end
end
