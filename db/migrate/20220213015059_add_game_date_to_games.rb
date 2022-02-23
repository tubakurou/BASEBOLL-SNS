class AddGameDateToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :game_date, :date
  end
end
