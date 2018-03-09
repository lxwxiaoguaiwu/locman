class AddTeacherReferToGrowthcurve < ActiveRecord::Migration[5.1]
  def change
    add_reference :growthcurves, :growthcurve, foreign_key: true
  end
end
