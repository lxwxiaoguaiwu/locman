class CreateWxsessions < ActiveRecord::Migration[5.1]
  def change
    create_table :wxsessions do |t|
      t.string :wxkey
      t.string :openid

      t.timestamps
    end
  end
end
