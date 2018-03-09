class AddLeixToSerman < ActiveRecord::Migration[5.1]
  def change
    add_column :sermen, :leixing, :string
  end
end
