class CreateGameTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :game_teams do |t|
      t.references :team, foreign_key: true, null: false
      t.references :game, foreign_key: true, null: false
      t.boolean :is_afters, default: false, null: false
      t.boolean :isattacks, default: false, null: false

      t.timestamps
    end
  end
end
