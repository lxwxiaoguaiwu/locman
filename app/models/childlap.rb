class Childlap < ApplicationRecord
  belongs_to :child

  def leibie_enum
    ['大运动', '精细运动', '认知行为', '语言行为','自理能力','社会情绪']
  end
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
