class RemoveLeixingFromSerman < ActiveRecord::Migration[5.1]
  def change
    remove_column :sermen, :leixing, :string
  end
end
