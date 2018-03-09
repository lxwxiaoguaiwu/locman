class AddTeacheridToChildlap < ActiveRecord::Migration[5.1]
  def change
    add_column :childlaps, :teacherid, :integer
  end
end
