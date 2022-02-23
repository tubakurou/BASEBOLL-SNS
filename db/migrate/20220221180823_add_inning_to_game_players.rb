class AddInningToGamePlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :game_players, :inning, :integer, default: 0, null: false
  end
end
