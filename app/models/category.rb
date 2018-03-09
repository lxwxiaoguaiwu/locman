class Category < ApplicationRecord
  belongs_to :alcohol
  has_many :imgcategories
  def leibie_enum
    ['白酒','洋酒','红酒','啤酒']
  end
  # after_commit :saveLeibie

  has_attached_file :asset,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
  # add a delete_<asset_name> method:
  attr_accessor :delete_asset
  before_validation { self.asset.clear if self.delete_asset == '1' }


  # def saveLeibie
  #   puts "self.alcohol.leibie = #{self.alcohol.leibie}------------"
  #   self.leibie = self.alcohol.leibie
  #   puts "self.leibie = #{self.leibie}------------"
  # end

end
