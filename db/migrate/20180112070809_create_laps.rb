class CreateLaps < ActiveRecord::Migration[5.1]
  def change
    create_table :laps do |t|
      t.integer :lapmonth
      t.string :lapcode
      t.string :lapcontent

      t.timestamps
    end
  end
end
