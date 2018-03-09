class CreateGradorders < ActiveRecord::Migration[5.1]
  def change
    create_table :gradorders do |t|
      t.string :status
      t.string :totalprice
      t.references :gradevin, foreign_key: true
      t.references :alcoholuser, foreign_key: true
      t.integer :addressid
      t.references :category, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
