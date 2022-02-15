class RemoveGameDayFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :game_day, :date
  end
end
