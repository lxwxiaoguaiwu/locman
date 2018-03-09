class AddGradevinReferenceToGradgoos < ActiveRecord::Migration[5.1]
  def change
    add_reference :gradgoods, :gradevin, foreign_key: true
  end
end
