class RemoveTmpresultFromGradorder < ActiveRecord::Migration[5.1]
  def change
    remove_column :gradorders, :tmpresult, :string
  end
end
