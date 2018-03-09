class Weixin < ApplicationRecord
  belongs_to :user
  belongs_to :xiaoqu
  has_many :weixinimgs
  acts_as_commentable
  paginates_per 15
end
