class CreatePasses < ActiveRecord::Migration[5.1]
  def change
    create_table :passes do |t|
      t.string :title
      t.string :leixing
      t.references :user, foreign_key: true
      t.references :xiaoqu, foreign_key: true

      t.timestamps
    end
  end
end
