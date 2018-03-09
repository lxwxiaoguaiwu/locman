class AddAuthenticationTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :wxsessions, :authentication_token, :string
  end
end
