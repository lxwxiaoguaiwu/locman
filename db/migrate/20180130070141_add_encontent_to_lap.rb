class AddEncontentToLap < ActiveRecord::Migration[5.1]
  def change
    add_column :laps, :encontent, :text
    add_column :laps, :guidecard, :text
  end
end
