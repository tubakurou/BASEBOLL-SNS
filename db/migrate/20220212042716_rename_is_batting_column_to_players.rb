class RenameIsBattingColumnToPlayers < ActiveRecord::Migration[5.2]
  def change
     rename_column :players, :is_Batting, :is_batting
  end
end
