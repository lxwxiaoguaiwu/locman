class AddCodeToQuxian < ActiveRecord::Migration[5.1]
  def change
    add_column :quxians, :code, :integer
  end
end
