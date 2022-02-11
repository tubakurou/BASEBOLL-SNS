class CreatePlayerResults < ActiveRecord::Migration[5.2]
  def change
    create_table :player_results do |t|
      t.references :game, foreign_key: true, null: false
      t.references :player, foreign_key: true, null: false
      t.integer :conced, default: 0, null: false #失点
      t.integer :pitch_boll, default: 0, null: false #球数
      t.integer :result_info #結果概要
      t.integer :order_status, default: 0, null: false #登録時スタメンステータス
      t.boolean :position_status, default: false , null: false #登録時守備ステータス
      t.timestamps
    end
  end
end
