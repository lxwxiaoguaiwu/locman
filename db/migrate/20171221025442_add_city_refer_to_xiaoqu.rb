class AddCityReferToXiaoqu < ActiveRecord::Migration[5.1]
  def change
    add_reference :xiaoqus, :city, foreign_key: true
  end
end
