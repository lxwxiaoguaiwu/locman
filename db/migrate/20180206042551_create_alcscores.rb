class CreateAlcscores < ActiveRecord::Migration[5.1]
  def change
    create_table :alcscores do |t|
      t.integer :code
      t.integer :maleco
      t.integer :femaleco
      t.references :alcohol, foreign_key: true

      t.timestamps
    end
  end
end
