class CreateTeamResults < ActiveRecord::Migration[5.2]
  def change
    create_table :team_results do |t|
      t.references :team, foreign_key: true, null: false
      t.references :game, foreign_key: true, null: false
      t.integer :error, default: 0, null: false
      t.integer :score, default: 0, null: false #チーム得点
      t.integer :hit, default: 0, null: false

      t.timestamps
    end
  end
end
