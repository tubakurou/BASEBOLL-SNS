class TeamResult < ApplicationRecord
  has_many :team_innings
  belongs_to :team
  belongs_to :game
end
