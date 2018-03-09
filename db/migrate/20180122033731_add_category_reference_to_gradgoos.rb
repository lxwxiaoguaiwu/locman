class AddCategoryReferenceToGradgoos < ActiveRecord::Migration[5.1]
  def change
    add_reference :gradgoods, :category, foreign_key: true
  end
end
