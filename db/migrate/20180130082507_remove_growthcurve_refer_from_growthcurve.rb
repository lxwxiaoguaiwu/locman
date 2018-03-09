class RemoveGrowthcurveReferFromGrowthcurve < ActiveRecord::Migration[5.1]
  def change
    remove_reference :growthcurves, :growthcurve, foreign_key: true
  end
end
