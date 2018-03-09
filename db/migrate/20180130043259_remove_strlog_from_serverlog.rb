class RemoveStrlogFromServerlog < ActiveRecord::Migration[5.1]
  def change
    remove_column :serverlogs, :strlog, :string
  end
end
