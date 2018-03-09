class AddSerialnumToWeborder < ActiveRecord::Migration[5.1]
  def change
    add_column :weborders, :serialnum, :string
  end
end
