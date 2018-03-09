class CreateLapreports < ActiveRecord::Migration[5.1]
  def change
    create_table :lapreports do |t|
      t.date :evaltime
      t.string :finescore
      t.string :groscore
      t.string :socialscore
      t.string :selfscore
      t.string :lanscore
      t.string :conscore
      t.string :fineage
      t.string :groage
      t.string :socialage
      t.string :selfage
      t.string :lanage
      t.string :conage
      t.text :comment

      t.timestamps
    end
  end
end
