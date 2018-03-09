class AddAlcoholReferenceToCategory < ActiveRecord::Migration[5.1]
  def change
    add_reference :categories, :alcohol, foreign_key: true
  end
end
