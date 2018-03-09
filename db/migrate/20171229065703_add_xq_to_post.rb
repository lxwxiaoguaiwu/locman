class AddXqToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :xiaoqu, foreign_key: true
  end
end
