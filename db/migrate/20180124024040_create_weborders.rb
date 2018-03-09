class CreateWeborders < ActiveRecord::Migration[5.1]
  def change
    create_table :weborders do |t|
      t.string :paystatus
      t.string :price
      t.references :alcoaddresses, foreign_key: true
      t.references :alcoholusers, foreign_key: true
      t.string :packstatus
      t.string :packprice

      t.timestamps
    end
  end
end
