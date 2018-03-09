class Child < ApplicationRecord
  has_many :childlaps
  has_many :equipments
  has_many :lapreport
  has_many :lapresults

  has_attached_file :avatar,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # add a delete_<avatar_name> method:
  attr_accessor :delete_avatar
  before_validation { self.avatar.clear if self.delete_avatar == '1' }
end
