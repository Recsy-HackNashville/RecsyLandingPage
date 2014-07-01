class AddHeadlineToUsers < ActiveRecord::Migration
  def change
    add_column :users, :headline, :string
  end
end
