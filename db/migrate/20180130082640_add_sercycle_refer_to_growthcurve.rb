class AddSercycleReferToGrowthcurve < ActiveRecord::Migration[5.1]
  def change
    add_reference :growthcurves, :sercycle, foreign_key: true
  end
end
