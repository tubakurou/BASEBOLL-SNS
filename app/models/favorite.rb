class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :game_comment
end
