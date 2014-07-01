class CreateSectionItems < ActiveRecord::Migration
  def change
    create_table :section_items do |t|
    	t.integer :section_id

      	t.timestamps
    end
  end
end
