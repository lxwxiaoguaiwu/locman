class AddDescToWeixin < ActiveRecord::Migration[5.1]
  def change
    add_column :weixins, :desc, :string
  end
end
