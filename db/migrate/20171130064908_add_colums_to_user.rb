class AddColumsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :wename, :string
    add_column :users, :gender, :boolean
    add_column :users, :weno, :string
    add_column :users, :isok, :boolean
  end
end
