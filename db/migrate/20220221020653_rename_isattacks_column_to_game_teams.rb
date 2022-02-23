class RenameIsattacksColumnToGameTeams < ActiveRecord::Migration[5.2]
  def change
    rename_column :game_teams, :isattacks, :is_attacks
  end
end
