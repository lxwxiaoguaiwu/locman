class AddAttachmentAssetToPasses < ActiveRecord::Migration[5.1]
  def self.up
    change_table :passes do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :passes, :asset
  end
end
