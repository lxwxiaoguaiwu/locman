class AddWkeyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :wkey, :string
  end
end
