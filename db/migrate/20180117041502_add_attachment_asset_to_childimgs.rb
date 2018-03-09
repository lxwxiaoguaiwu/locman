class AddAttachmentAssetToChildimgs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :childimgs do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :childimgs, :asset
  end
end
