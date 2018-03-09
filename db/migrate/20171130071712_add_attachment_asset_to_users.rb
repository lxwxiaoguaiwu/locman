class AddAttachmentAssetToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :users, :asset
  end
end
