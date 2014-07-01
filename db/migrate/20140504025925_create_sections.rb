class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :section_type_id
      t.integer :user_id

      t.timestamps
    end
  end
end
