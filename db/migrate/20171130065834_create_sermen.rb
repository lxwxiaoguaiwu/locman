class CreateSermen < ActiveRecord::Migration[5.1]
  def change
    create_table :sermen do |t|
      t.string :name
      t.string :phone
      t.text :desc
      t.boolean :gender

      t.timestamps
    end
  end
end
