class RemoveAlcoholusersRefeFromWeborder < ActiveRecord::Migration[5.1]
  def change
    remove_reference :weborders, :alcoholusers, foreign_key: true


  end
end
