class AddSercycleReferToCheckup < ActiveRecord::Migration[5.1]
  def change
    add_reference :checkups, :sercycle, foreign_key: true
  end
end
