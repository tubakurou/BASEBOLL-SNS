class TeamResult < ApplicationRecord
  has_many :team_inning
  belongs_to :team
  belongs_to :game
end
