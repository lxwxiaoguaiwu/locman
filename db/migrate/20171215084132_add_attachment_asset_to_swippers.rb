class AddAttachmentAssetToSwippers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :swippers do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :swippers, :asset
  end
end
