class AddAttachmentAssetToPassimg < ActiveRecord::Migration[5.1]
  def self.up
    change_table :passimgs do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :passimgs, :asset
  end
end
