class AddCategoryReferToWebgood < ActiveRecord::Migration[5.1]
  def change
    add_reference :webgoods, :category, foreign_key: true
  end
end
