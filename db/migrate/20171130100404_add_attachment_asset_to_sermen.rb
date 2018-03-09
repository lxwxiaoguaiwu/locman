class AddAttachmentAssetToSermen < ActiveRecord::Migration[5.1]
  def self.up
    change_table :sermen do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :sermen, :asset
  end
end
