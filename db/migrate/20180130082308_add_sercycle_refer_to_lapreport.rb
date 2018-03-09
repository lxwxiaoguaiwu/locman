class AddSercycleReferToLapreport < ActiveRecord::Migration[5.1]
  def change
    add_reference :lapreports, :sercycle, foreign_key: true
  end
end
