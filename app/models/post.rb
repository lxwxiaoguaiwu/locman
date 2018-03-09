class Post < ApplicationRecord
  acts_as_commentable
  belongs_to :user
  belongs_to :xiaoqu
  has_many :postimgs
  acts_as_votable
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
end
