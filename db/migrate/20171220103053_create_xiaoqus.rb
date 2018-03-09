class CreateXiaoqus < ActiveRecord::Migration[5.1]
  def change
    create_table :xiaoqus do |t|
      t.string :name
      t.references :shangquan, foreign_key: true
      t.string :pinyin

      t.timestamps
    end
  end
end
