class AddReferchildToEquipment < ActiveRecord::Migration[5.1]
  def change
    add_reference :equipment, :child, foreign_key: true
  end
end
