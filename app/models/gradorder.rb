class Gradorder < ApplicationRecord
  belongs_to :gradevin
  belongs_to :alcoholuser
  belongs_to :category

  def stauts_enum
    ['待使用','待支付','待评价','已完成']
  end
  before_validation :validserial, on: :create

  def validserial
    self.serialnum = SecureRandom.hex(10)
  end

end
