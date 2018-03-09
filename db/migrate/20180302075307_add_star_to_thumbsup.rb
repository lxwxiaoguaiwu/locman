class AddStarToThumbsup < ActiveRecord::Migration[5.1]
  def change
    add_column :thumbsups, :star, :integer
  end
end
