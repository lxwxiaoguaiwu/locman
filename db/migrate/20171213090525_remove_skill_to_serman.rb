class RemoveSkillToSerman < ActiveRecord::Migration[5.1]
  def change
    remove_column :sermen, :skill, :string
  end
end
