class RemoveLapcodeFromLap < ActiveRecord::Migration[5.1]
  def change
    remove_column :laps, :lapcode, :intger
  end
end
