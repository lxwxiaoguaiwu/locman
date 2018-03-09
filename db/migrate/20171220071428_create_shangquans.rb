class CreateShangquans < ActiveRecord::Migration[5.1]
  def change
    create_table :shangquans do |t|
      t.string :name
      t.references :quxian, foreign_key: true

      t.timestamps
    end
  end
end
