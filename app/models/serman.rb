class Serman < ApplicationRecord
  acts_as_commentable
  belongs_to :user
  belongs_to :xiaoqu
  belongs_to :post
  has_many :thumbsups
  has_many :users, through: :thumbsups
  # acts_as_taggable
  before_validation :create_post, on: :create
  has_attached_file :asset,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
  # add a delete_<asset_name> method:
  attr_accessor :delete_asset
  before_validation { self.asset.clear if self.delete_asset == '1' }


  def leixing_enum
    ['阿姨','师傅','私教','快递']
  end

  private

  def create_post
    post = Post.new()
    post.title = self.name
    post.user_id = self.user_id
    post.leixing = "serman"
    post.xiaoqu_id = self.xiaoqu_id
    post.save
    self.post_id = post.id
  end



end
