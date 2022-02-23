class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.references :team, foreign_key: true, null: false
      t.string :goods_image_id
      t.string :goods_name, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
