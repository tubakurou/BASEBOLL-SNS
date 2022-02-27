class Player < ApplicationRecord
  attachment :player_image
  belongs_to :team, optional: true
  has_many :game_players
  has_many  :games, through: :game_players

  enum position_status: {
    x: 0, "2B": 1, "SS": 2, "3B": 3, "1B": 4, "C": 5, "LF": 6, "CF": 7, "RF": 8, "DH": 9, "P": 10, "B": 11
  }, _prefix: true

  enum order_status: {
    "0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 10
  }, _prefix: true

  enum run_status: {
    "0": 0, "1": 1, "2": 2, "3": 3
  }
end
