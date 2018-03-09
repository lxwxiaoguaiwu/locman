class AddCodeToLap < ActiveRecord::Migration[5.1]
  def change
    add_column :laps, :code, :integer
  end
end
