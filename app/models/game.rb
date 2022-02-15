class Game < ApplicationRecord
   attachment :player_image
   has_many  :game_teams
   has_many  :teams, through: :game_teams
   has_many  :game_players
   has_many  :players, through: :game_players
   has_many  :team_results
   has_many  :game_comments
   has_many  :teames
   def already_game_teamed?(team)
    self.game_teams.exists?(team_id: team.id)
   end
end
