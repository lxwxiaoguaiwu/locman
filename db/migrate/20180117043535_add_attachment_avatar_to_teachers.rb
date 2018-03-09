class AddAttachmentAvatarToTeachers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :teachers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :teachers, :avatar
  end
end
