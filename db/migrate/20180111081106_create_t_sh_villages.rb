class CreateTShVillages < ActiveRecord::Migration[5.1]
  def change
    create_table :t_sh_villages do |t|
      t.string :housetitle
      t.string :address
      t.string :quxian
      t.string :shangquan
      t.string :sqpinyin
      t.integer :money
      t.string :image
      t.string :url
      t.text :desc

      t.timestamps
    end
  end
end
