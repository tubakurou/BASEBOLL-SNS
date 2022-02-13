class Team < ApplicationRecord
  attachment :team_image
  has_many :player, dependent: :destroy
  has_many :card, dependent: :destroy
  has_many :good, dependent: :destroy
  has_many :team_resuit, dependent: :destroy
  
end
