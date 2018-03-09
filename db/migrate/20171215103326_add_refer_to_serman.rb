class AddReferToSerman < ActiveRecord::Migration[5.1]
  def change
    add_reference :sermen, :user, foreign_key: true
  end
end
