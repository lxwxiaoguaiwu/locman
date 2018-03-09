class AddResponsebodyToAlcoholuser < ActiveRecord::Migration[5.1]
  def change
    add_column :alcoholusers, :responsebody, :string
  end
end
