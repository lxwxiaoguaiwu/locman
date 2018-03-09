class CreateChildimgs < ActiveRecord::Migration[5.1]
  def change
    create_table :childimgs do |t|

      t.timestamps
    end
  end
end
