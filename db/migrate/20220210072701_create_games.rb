class CreateGames < ActiveRecord::Migration[5.2]
  def change
    
    create_table :games do |t|
      t.date  :game_day, null: false
      t.string  :stadium #開催球場
      t.string  :game_show #試合詳細
      t.integer :game_status, default: 0, null: false
      t.integer :strike, default: 0, null: false
      t.integer :boll, default: 0, null: false
      t.integer :out, default: 0, null: false
      t.string  :result_show #状況詳細
      t.string  :game_image_id

      t.timestamps
    end
  end
end
