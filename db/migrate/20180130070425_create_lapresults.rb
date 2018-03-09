class CreateLapresults < ActiveRecord::Migration[5.1]
  def change
    create_table :lapresults do |t|
      t.references :child, foreign_key: true
      t.date :evaltime
      t.string :leibie
      t.references :lap, foreign_key: true
      t.boolean :result
      t.text :comment

      t.timestamps
    end
  end
end
