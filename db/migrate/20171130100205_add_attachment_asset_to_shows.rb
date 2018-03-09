class AddAttachmentAssetToShows < ActiveRecord::Migration[5.1]
  def self.up
    change_table :shows do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :shows, :asset
  end
end
