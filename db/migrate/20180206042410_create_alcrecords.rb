class CreateAlcrecords < ActiveRecord::Migration[5.1]
  def change
    create_table :alcrecords do |t|
      t.string :tagsc
      t.references :alcohol, foreign_key: true
      t.references :alcoholuser, foreign_key: true

      t.timestamps
    end
  end
end
