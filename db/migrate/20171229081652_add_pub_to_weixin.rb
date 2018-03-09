class AddPubToWeixin < ActiveRecord::Migration[5.1]
  def change
    add_column :weixins, :ispub, :boolean
    add_reference :weixins, :xiaoqu, foreign_key: true
  end
end
