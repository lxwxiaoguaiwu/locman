class AddQuxianReferToXiaoqu < ActiveRecord::Migration[5.1]
  def change
    add_reference :xiaoqus, :quxian, foreign_key: true
  end
end
