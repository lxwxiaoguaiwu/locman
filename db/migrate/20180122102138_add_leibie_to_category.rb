class AddLeibieToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :leibie, :string
  end
end
