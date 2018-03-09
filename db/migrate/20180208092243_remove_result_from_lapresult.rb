class RemoveResultFromLapresult < ActiveRecord::Migration[5.1]
  def change
    remove_column :lapresults, :result, :boolean
  end
end
