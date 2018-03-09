class RemoveAlcoaddressesRefeFromWeborder < ActiveRecord::Migration[5.1]
  def change
    remove_reference :weborders, :alcoaddresses, foreign_key: true
  end
end
