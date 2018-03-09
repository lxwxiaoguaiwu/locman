class AddAttachmentAssetToCategories < ActiveRecord::Migration[5.1]
  def self.up
    change_table :categories do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :categories, :asset
  end
end
