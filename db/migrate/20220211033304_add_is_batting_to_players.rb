class AddIsBattingToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :is_Batting, :boolean, default: 0, null: false
  end
end
