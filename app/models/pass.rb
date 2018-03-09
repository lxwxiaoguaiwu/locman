class Pass < ApplicationRecord
  belongs_to :user
  belongs_to :xiaoqu
  has_many :exchanges
  has_many :users, through: :exchanges
  has_many :passimgs
  # before_validation :destory_involved, on: :destory
  acts_as_commentable
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


  # private
  #
  # def destory_involved
  #   puts "---------------------------------kkkk"
  #   exchanges = Exchange.where(pass_id: self.id)
  #   puts "exchanges.length = #{exchanges.length}-------------0"
  #   if exchanges.length != 0
  #     exchanges.destory_all
  #     puts "exchanges.length = #{exchanges.length}-------------1"
  #   else
  #     puts "---------------------2"
  #   end
  # end
end
