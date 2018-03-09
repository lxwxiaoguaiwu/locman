class AddOpenidToAlcoholuser < ActiveRecord::Migration[5.1]
  def change
    add_column :alcoholusers, :openid, :string
  end
end
