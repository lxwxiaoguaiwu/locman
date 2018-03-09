class RemovePackagestatusFromWeborder < ActiveRecord::Migration[5.1]
  def change
    remove_column :weborders, :packagestatus, :string
  end
end
