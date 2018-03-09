class AddSkillsToSerman < ActiveRecord::Migration[5.1]
  def change
    add_column :sermen, :skills, :string
  end
end
