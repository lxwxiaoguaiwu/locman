class AddMonthToLap < ActiveRecord::Migration[5.1]
  def change
    add_column :laps, :month, :integer
  end
end
