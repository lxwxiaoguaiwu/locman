class AddReferToWxsession < ActiveRecord::Migration[5.1]
  def change
    add_reference :wxsessions, :user, foreign_key: true
  end
end
