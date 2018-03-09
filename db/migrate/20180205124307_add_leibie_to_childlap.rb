class AddLeibieToChildlap < ActiveRecord::Migration[5.1]
  def change
    add_column :childlaps, :leibie, :string
  end
end
