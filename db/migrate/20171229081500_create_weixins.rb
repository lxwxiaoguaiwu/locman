class CreateWeixins < ActiveRecord::Migration[5.1]
  def change
    create_table :weixins do |t|
      t.string :name
      t.string :weino
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
