class GameComment < ApplicationRecord
 belongs_to :user  
 belongs_to :game
 
 has_many :likes, dependent: :destroy
 has_many :users, through: :likes
end

