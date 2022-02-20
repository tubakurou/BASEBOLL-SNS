class Users::FavoritesController < ApplicationController
   def create
     @game = Game.find(params[:game_id])
     @game_comment = GameComment.find(params[:game_comment_id])
     @game_comments = @game.game_comments.includes(:user).order(created_at: :desc)
    favorite = current_user.favorites.new(game_comment_id: @game_comment.id)
    favorite.save
    
  end

  def destroy
    @game = Game.find(params[:game_id])
    @game_comment = GameComment.find(params[:game_comment_id])
    favorite = current_user.favorites.find_by(game_comment_id: @game_comment.id)
    favorite.destroy
  end
end

