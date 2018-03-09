class CreateCheckups < ActiveRecord::Migration[5.1]
  def change
    create_table :checkups do |t|
      t.string :lefteye
      t.string :righteye
      t.string :lefthearing
      t.string :righthearing
      t.string :teeth
      t.string :heartrate
      t.string :tempertature
      t.string :diastolic
      t.string :systolic
      t.date :evaltime

      t.timestamps
    end
  end
end
