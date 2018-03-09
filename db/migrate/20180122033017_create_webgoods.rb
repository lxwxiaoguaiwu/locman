class CreateWebgoods < ActiveRecord::Migration[5.1]
  def change
    create_table :webgoods do |t|
      t.string :status
      t.integer :number
      t.string :preprice
      t.string :currprice

      t.timestamps
    end
  end
end
