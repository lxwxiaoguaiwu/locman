class Gradgood < ApplicationRecord
  belongs_to :gradevin
  belongs_to :category
  def status_enum
    ['上架','下架']
  end
end
