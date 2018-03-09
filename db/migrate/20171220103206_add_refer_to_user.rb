class AddReferToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :xiaoqu, foreign_key: true
  end
end
