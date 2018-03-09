class AddCodeToShangquan < ActiveRecord::Migration[5.1]
  def change
    add_column :shangquans, :code, :integer
  end
end
