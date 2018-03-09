class AddTeacherReferToCheckup < ActiveRecord::Migration[5.1]
  def change
    add_reference :checkups, :teacher, foreign_key: true
  end
end
