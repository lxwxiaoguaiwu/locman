class RemoveLapcontentFromLap < ActiveRecord::Migration[5.1]
  def change
    remove_column :laps, :lapcontent, :string
  end
end
