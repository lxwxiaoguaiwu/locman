class AddSerialnumToGradorders < ActiveRecord::Migration[5.1]
  def change
    add_column :gradorders, :serialnum, :string
  end
end
