class AddPackagestatusToWeborder < ActiveRecord::Migration[5.1]
  def change
    add_column :weborders, :packagestatus, :string
  end
end
