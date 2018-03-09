class AddTmpresultToGradorder < ActiveRecord::Migration[5.1]
  def change
    add_column :gradorders, :tmpresult, :string
  end
end
