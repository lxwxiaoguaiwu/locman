class AddLeixingToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :leixing, :string, :default => 'event'
  end
end
