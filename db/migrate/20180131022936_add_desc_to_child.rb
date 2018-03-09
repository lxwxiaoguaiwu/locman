class AddDescToChild < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :desc, :string
  end
end
