class Alcohol < ApplicationRecord
  has_many :category
  def leibie_enum
    ['白酒','洋酒','红酒','啤酒']
  end
end
