class AddSessionkeyToAlcoholuser < ActiveRecord::Migration[5.1]
  def change
    add_column :alcoholusers, :sessionkey, :string
  end
end
