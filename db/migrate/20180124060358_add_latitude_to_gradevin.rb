class AddLatitudeToGradevin < ActiveRecord::Migration[5.1]
  def change
    add_column :gradevins, :latitude, :string
    add_column :gradevins, :longitude, :string
  end
end
