class AddReferchildToChildlap < ActiveRecord::Migration[5.1]
  def change
    add_reference :childlaps, :child, foreign_key: true
    add_reference :childlaps, :lap, foreign_key: true
  end
end
