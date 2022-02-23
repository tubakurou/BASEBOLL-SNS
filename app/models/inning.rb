class Inning < ApplicationRecord
  belongs_to :team_inning
  belongs_to :prayer_inning
end
