class AddContentToLap < ActiveRecord::Migration[5.1]
  def change
    add_column :laps, :content, :string
  end
end
