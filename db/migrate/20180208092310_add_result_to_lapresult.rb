class AddResultToLapresult < ActiveRecord::Migration[5.1]
  def change
    add_column :lapresults, :result, :integer
  end
end
