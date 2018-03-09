class CreateOrderitems < ActiveRecord::Migration[5.1]
  def change
    create_table :orderitems do |t|
      t.references :weborder, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
