class Orderitem < ApplicationRecord
  belongs_to :weborder
  belongs_to :category
end
