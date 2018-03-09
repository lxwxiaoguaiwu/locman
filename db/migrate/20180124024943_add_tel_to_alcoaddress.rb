class AddTelToAlcoaddress < ActiveRecord::Migration[5.1]
  def change
    add_column :alcoaddresses, :tel, :string
    add_column :alcoaddresses, :addressinfo, :string
    add_column :alcoaddresses, :toname, :string
  end
end
