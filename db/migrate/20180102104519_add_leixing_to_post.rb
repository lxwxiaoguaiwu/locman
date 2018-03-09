class AddLeixingToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :leixing, :string
  end
end
