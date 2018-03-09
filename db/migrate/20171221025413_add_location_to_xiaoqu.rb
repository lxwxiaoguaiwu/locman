class AddLocationToXiaoqu < ActiveRecord::Migration[5.1]
  def change
    add_column :xiaoqus, :location, :string
  end
end
