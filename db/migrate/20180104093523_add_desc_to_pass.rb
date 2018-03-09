class AddDescToPass < ActiveRecord::Migration[5.1]
  def change
    add_column :passes, :desc, :string
  end
end
