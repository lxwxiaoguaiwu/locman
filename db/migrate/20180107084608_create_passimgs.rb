class CreatePassimgs < ActiveRecord::Migration[5.1]
  def change
    create_table :passimgs do |t|
      t.references :pass, foreign_key: true

      t.timestamps
    end
  end
end
