class RemoveReferFromSerman < ActiveRecord::Migration[5.1]
  def change
    remove_reference :sermen, :shangquan, foreign_key: true
  end
end
