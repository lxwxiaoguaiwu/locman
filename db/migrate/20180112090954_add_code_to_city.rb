class AddCodeToCity < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :code, :integer
  end
end
