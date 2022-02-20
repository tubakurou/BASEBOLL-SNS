class GameComment < ApplicationRecord
 belongs_to :user  
 belongs_to :game
 has_many :favorites, dependent: :destroy
 has_many :users, through: :favorites
 def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end

