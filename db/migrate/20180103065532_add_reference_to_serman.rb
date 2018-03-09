class AddReferenceToSerman < ActiveRecord::Migration[5.1]
  def change
    add_reference :sermen, :xiaoqu, foreign_key: true
  end
end
