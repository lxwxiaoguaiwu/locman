class AddReferToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :xiaoqu, foreign_key: true
  end
end
