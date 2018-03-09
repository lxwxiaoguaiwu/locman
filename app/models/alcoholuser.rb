class Alcoholuser < ApplicationRecord
  has_many :gradorders
  has_many :weborders
end
