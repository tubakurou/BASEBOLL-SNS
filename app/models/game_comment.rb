class GameComment < ApplicationRecord
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  def favorited_by?(user)
     favorites.where(user_id: user.id).exists?
  end
def self.search(word)
  where(["game_contents like?", "%#{word}%"])
end
end

