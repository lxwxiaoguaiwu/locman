class Webgood < ApplicationRecord
    belongs_to :category
  def status_enum
    ['上架','下架']
  end
end
