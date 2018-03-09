class Gradevin < ApplicationRecord
  has_many :gradgoods
  def stauts_enum
    ['营业中','建设中','维护中']
  end
end
