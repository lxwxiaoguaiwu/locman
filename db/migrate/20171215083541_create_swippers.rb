class CreateSwippers < ActiveRecord::Migration[5.1]
  def change
    create_table :swippers do |t|

      t.timestamps
    end
  end
end
