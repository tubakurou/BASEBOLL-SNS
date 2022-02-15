class Team < ApplicationRecord
  attachment :team_image
  has_many :game_teams
  has_many :games, through: :game_teams
  has_many :players, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :team_resuts, dependent: :destroy
end
