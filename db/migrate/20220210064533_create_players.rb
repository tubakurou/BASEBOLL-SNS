class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
       t.references :team, foreign_key: true, null: false
      t.string :player_image_id
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :number, null: false
      t.string :dominant_pitch, null: false #利き投げ
      t.string :dominant_bat, null: false #効き打ち
      t.boolean :play_status, default: false, null: false #スタメン順位または控え
      t.integer :order_status, default: 0, null: false #試合登録の有無
      t.integer :position_status, default: 0, null: false

      t.timestamps
    end
  end
end
