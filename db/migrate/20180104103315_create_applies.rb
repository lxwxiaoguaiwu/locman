class CreateApplies < ActiveRecord::Migration[5.1]
  def change
    create_table :applies do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.string :desc

      t.timestamps
    end
  end
end
