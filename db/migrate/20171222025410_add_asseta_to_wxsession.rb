class AddAssetaToWxsession < ActiveRecord::Migration[5.1]
  def self.up
    change_table :wxsessions do |t|
      t.attachment :asseta
    end
  end
  def self.down
    remove_attachment :wxsessions, :asseta
  end
end
