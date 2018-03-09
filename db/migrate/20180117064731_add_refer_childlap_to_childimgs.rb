class AddReferChildlapToChildimgs < ActiveRecord::Migration[5.1]
  def change
    add_reference :childimgs, :childlap, foreign_key: true
  end
end
