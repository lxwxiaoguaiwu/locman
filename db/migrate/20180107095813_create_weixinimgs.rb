class CreateWeixinimgs < ActiveRecord::Migration[5.1]
  def change
    create_table :weixinimgs do |t|
      t.references :weixin, foreign_key: true

      t.timestamps
    end
  end
end
