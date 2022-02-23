class Game < ApplicationRecord
   attachment :player_image
  
   has_many  :game_teams
   has_many  :teams, through: :game_teams
   has_many  :game_players
   has_many  :players, through: :game_players
   has_many  :team_results, dependent: :destroy
   has_many  :game_comments, dependent: :destroy
   has_many  :teames

   enum game_status: {
    "試合前": 0, "試合中": 1, "試合後": 2
  }
  enum boll: {
    "0": 0, "1": 1, "2": 2, "3": 3, "4": 4
  },_prefix: true
   enum strike: {
    "0": 0, "1": 1, "2": 2, "3": 3
  },_prefix: true
   enum out: {
    "0": 0, "1": 1, "2": 2, "3": 3
  },_prefix: true

   def already_game_teamed?(team)
    self.game_teams.exists?(team_id: team.id)
   end
end
