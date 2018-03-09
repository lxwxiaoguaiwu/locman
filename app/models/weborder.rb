class Weborder < ApplicationRecord
  belongs_to :alcoaddress
  belongs_to :alcoholuser
  has_many :orderitems

  def paystatus_enum
    ['已完成','待支付','待评价']
  end
  before_validation :validserial, on: :create

  def validserial
    self.serialnum = SecureRandom.hex(10)
  end
end
