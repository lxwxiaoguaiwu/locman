class AddLogtextToServerlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :serverlogs, :logtext, :text
  end
end
