class AddGenderToAlcoholuser < ActiveRecord::Migration[5.1]
  def change
    add_column :alcoholusers, :gender, :integer
  end
end
