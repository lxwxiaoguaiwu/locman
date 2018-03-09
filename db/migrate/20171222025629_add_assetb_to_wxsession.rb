class AddAssetbToWxsession < ActiveRecord::Migration[5.1]
  def self.up
    change_table :wxsessions do |t|
      t.attachment :assetb
    end
  end
  def self.down
    remove_attachment :wxsessions, :assetb
  end
end
