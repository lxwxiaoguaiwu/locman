class AddCodeToXiaoqu < ActiveRecord::Migration[5.1]
  def change
    add_column :xiaoqus, :code, :integer
  end
end
