class CreateThumbsups < ActiveRecord::Migration[5.1]
  def change
    create_table :thumbsups do |t|
      t.references :user, foreign_key: true
      t.references :serman, foreign_key: true
      t.string :tag
      t.string :desc

      t.timestamps
    end
  end
end
