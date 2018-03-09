class CreateExchanges < ActiveRecord::Migration[5.1]
  def change
    create_table :exchanges do |t|
      t.references :user, foreign_key: true
      t.references :pass, foreign_key: true
      t.string :desc

      t.timestamps
    end
  end
end
