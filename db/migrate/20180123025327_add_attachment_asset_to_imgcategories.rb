class AddAttachmentAssetToImgcategories < ActiveRecord::Migration[5.1]
  def self.up
    change_table :imgcategories do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :imgcategories, :asset
  end
end
