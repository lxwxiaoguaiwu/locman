class Childimg < ApplicationRecord
  after_save :sendmsg

  belongs_to :childlap
  has_attached_file :asset,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
  # add a delete_<asset_name> method:
  attr_accessor :delete_asset
  before_validation { self.asset.clear if self.delete_asset == '1' }

  private
  def sendmsg
    puts "11111111111111111111"
    ActionCable.server.broadcast(
      'chat_1', # 这是流的名字，要跟在 stream_from 定义的保持一致
      clapid: self.childlap_id,
      time: self.created_at.strftime("%Y-%m-%d").to_s,
      body: "xxx"
    )
  end
end
