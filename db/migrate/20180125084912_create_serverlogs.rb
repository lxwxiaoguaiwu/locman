class CreateServerlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :serverlogs do |t|
      t.string :strlog

      t.timestamps
    end
  end
end
