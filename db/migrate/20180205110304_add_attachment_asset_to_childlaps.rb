class AddAttachmentAssetToChildlaps < ActiveRecord::Migration[5.1]
  def self.up
    change_table :childlaps do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :childlaps, :asset
  end
end
