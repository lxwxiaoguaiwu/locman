class AddPinyinToShangquan < ActiveRecord::Migration[5.1]
  def change
    add_column :shangquans, :pinyin, :string
  end
end
