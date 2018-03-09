class CreateSercycles < ActiveRecord::Migration[5.1]
  def change
    create_table :sercycles do |t|
      t.references :child, foreign_key: true
      t.string :desc
      t.date :dota
      t.date :dotb
      t.date :dotc

      t.timestamps
    end
  end
end
