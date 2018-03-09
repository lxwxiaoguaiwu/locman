class AddShangquanReferToSerman < ActiveRecord::Migration[5.1]
  def change
    add_reference :sermen, :shangquan, foreign_key: true
  end
end
