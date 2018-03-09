class AddAttachmentAssetToPostimg < ActiveRecord::Migration[5.1]
  def self.up
    change_table :postimgs do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :postimgs, :asset
  end
end
