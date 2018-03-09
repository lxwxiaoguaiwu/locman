class AddAttachmentAssetToWeixin < ActiveRecord::Migration[5.1]
  def self.up
    change_table :weixinimgs do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :weixinimgs, :asset
  end
end
