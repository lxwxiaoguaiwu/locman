class AddAlcoaddressReferToWeborder < ActiveRecord::Migration[5.1]
  def change
    add_reference :weborders, :alcoaddress, foreign_key: true
    add_reference :weborders, :alcoholuser, foreign_key: true
  end
end
