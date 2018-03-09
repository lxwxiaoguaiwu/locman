class Event < ApplicationRecord
  belongs_to :post
  belongs_to :xiaoqu
  belongs_to :user
  has_many :applies
  has_many :users, through: :applies
  before_validation :create_post, on: :create


  private

  def create_post
    post = Post.new()
    post.title = self.title
    post.user_id = self.user_id
    post.leixing = "event"
    post.xiaoqu_id = self.xiaoqu_id
    post.save
    self.post_id = post.id
  end
end
