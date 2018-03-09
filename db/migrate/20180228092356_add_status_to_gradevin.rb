class AddStatusToGradevin < ActiveRecord::Migration[5.1]
  def change
    add_column :gradevins, :status, :string
  end
end
