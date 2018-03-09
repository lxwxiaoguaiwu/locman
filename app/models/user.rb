class User < ApplicationRecord
  has_many :applies
  has_many :event, through: :applies

  has_many :exchanges
  has_many :passes, through: :exchanges

  paginates_per 15
  has_attached_file :asset,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
  # add a delete_<asset_name> method:
  attr_accessor :delete_asset
  before_validation { self.asset.clear if self.delete_asset == '1' }

  before_create :generate_authentication_token

 def generate_authentication_token
   loop do
     self.authentication_token = SecureRandom.base64(64)
     break if !User.find_by(authentication_token: authentication_token)
   end
 end

 def reset_auth_token!
   generate_authentication_token
   save
 end
end
