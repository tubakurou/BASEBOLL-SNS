class Users::UsersController < ApplicationController
  
  has_many :game_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_game_comments, through: :likes, source: :game_comment
 
  def own?(object)
    id == object.user_id
  end

  def like(game_comment)
    likes.find_or_create_by(game_comment: game_comment)
  end

  def like?(game_comment)
    like_posts.include?(game_comment)
  end

  def unlike(game_comment)
    like_game_comment.delete(game_comment)
    
  end
end
