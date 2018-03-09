class CreateGrowthcurves < ActiveRecord::Migration[5.1]
  def change
    create_table :growthcurves do |t|
      t.date :evaltime
      t.string :circum
      t.string :height
      t.string :weight
      t.string :bmi

      t.timestamps
    end
  end
end
