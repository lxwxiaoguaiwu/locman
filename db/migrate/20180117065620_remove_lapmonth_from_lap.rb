class RemoveLapmonthFromLap < ActiveRecord::Migration[5.1]
  def change
    remove_column :laps, :lapmonth, :integer
  end
end
