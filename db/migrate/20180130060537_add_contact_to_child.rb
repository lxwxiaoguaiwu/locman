class AddContactToChild < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :contact, :string
    add_column :children, :conphone, :string
    add_column :children, :starttime, :date
    add_column :children, :endtime, :date
    add_reference :children, :xiaoqu, foreign_key: true
  end
end
