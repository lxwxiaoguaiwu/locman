class AddAttachmentAssetToWegroups < ActiveRecord::Migration[5.1]
  def self.up
    change_table :wegroups do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :wegroups, :asset
  end
end
