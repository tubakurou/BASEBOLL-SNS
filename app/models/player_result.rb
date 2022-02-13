class PlayerResult < ApplicationRecord
  has_many :prayer_inning
  belongs_to :prayer
  belongs_to :game
end
