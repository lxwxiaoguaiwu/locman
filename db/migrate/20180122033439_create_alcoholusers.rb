class CreateAlcoholusers < ActiveRecord::Migration[5.1]
  def change
    create_table :alcoholusers do |t|
      t.string :wename
      t.string :weasset

      t.timestamps
    end
  end
end
