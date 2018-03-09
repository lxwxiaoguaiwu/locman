class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :standard
      t.string :desc
      t.string :price
      t.integer :code

      t.timestamps
    end
  end
end
