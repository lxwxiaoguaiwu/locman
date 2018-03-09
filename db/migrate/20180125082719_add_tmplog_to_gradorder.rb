class AddTmplogToGradorder < ActiveRecord::Migration[5.1]
  def change
    add_column :gradorders, :tmplog, :string
  end
end
