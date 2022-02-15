class CreateGamePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :game_players do |t|
      t.references :player, foreign_key: true, null: false
      t.references :game, foreign_key: true, null: false
      t.integer :count, default: 0, null: false
      t.integer :lost,default: 0, null: false
      t.string  :results
      t.integer :order_status, default: 0, null: false #試合登録の有無
      t.integer :position_status, default: 0, null: false
      t.integer :inning_status, default: 0, null: false

      t.timestamps
    end
  end
end
