class AddLeibieToLap < ActiveRecord::Migration[5.1]
  def change
    add_column :laps, :leibie, :string
  end
end
