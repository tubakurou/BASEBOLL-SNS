class Game < ApplicationRecord
   has_many　:card
   has_many　:player_result
   has_many　:team_result
   has_many　:comment
end
