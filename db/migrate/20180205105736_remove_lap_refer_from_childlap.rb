class RemoveLapReferFromChildlap < ActiveRecord::Migration[5.1]
  def change
    remove_reference :childlaps, :lap, foreign_key: true
  end
end
