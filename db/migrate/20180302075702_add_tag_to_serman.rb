class AddTagToSerman < ActiveRecord::Migration[5.1]
  def change
    add_column :sermen, :tag, :string
  end
end
