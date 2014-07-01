class AddLocationNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location_name, :string
  end
end
