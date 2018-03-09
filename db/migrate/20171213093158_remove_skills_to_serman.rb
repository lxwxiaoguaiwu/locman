class RemoveSkillsToSerman < ActiveRecord::Migration[5.1]
  def change
    remove_column :sermen, :skills, :string
  end
end
