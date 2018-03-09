class CreateAlcoaddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :alcoaddresses do |t|
      t.references :alcoholuser, foreign_key: true

      t.timestamps
    end
  end
end
