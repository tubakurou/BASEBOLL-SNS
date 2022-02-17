class Users::LikesController < ApplicationController
   def create
    @game_comment = GameComment.find(params[:game_comment])
    current_user.like(@game_comment)
  end

  def destroy
    @game_comment = Like.find(params[:id]).game_comment
    current_user.unlike(@game_comment)
  end
end
