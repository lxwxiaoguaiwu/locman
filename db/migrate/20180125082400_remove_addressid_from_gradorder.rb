class RemoveAddressidFromGradorder < ActiveRecord::Migration[5.1]
  def change
    remove_column :gradorders, :addressid, :integer
  end
end
