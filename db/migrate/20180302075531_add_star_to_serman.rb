class AddStarToSerman < ActiveRecord::Migration[5.1]
  def change
    add_column :sermen, :star, :integer
  end
end
