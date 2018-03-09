class Wxsession < ApplicationRecord
  has_attached_file :asseta,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  validates_attachment_content_type :asseta, :content_type => /\Aimage\/.*\Z/
  # add a delete_<asset_name> method:
  attr_accessor :delete_asseta
  before_validation { self.asseta.clear if self.delete_asseta == '1' }

  has_attached_file :assetb,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  validates_attachment_content_type :assetb, :content_type => /\Aimage\/.*\Z/
  # add a delete_<asset_name> method:
  attr_accessor :delete_assetb
  before_validation { self.assetb.clear if self.delete_assetb == '1' }
end
