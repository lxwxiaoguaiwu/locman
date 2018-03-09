class AddSkillToSerman < ActiveRecord::Migration[5.1]
  def change
    add_column :sermen, :skill, :string
  end
end
