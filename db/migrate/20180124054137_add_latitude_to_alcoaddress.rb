class AddLatitudeToAlcoaddress < ActiveRecord::Migration[5.1]
  def change
    add_column :alcoaddresses, :latitude, :string
    add_column :alcoaddresses, :longitude, :string
  end
end
