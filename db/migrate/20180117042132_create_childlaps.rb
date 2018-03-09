class CreateChildlaps < ActiveRecord::Migration[5.1]
  def change
    create_table :childlaps do |t|
      t.string :desc

      t.timestamps
    end
  end
end
