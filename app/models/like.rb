class Like < ApplicationRecord
  belongs_to :game_comment
  belongs_to :user
end
