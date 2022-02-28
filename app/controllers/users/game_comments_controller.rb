class Users::GameCommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @game_comment = GameComment.new(game_comment_params)
    @game_comments = @game.game_comments.includes(:user).order(created_at: :desc)
    @game_comment.game_id = @game.id
    @game_comment.user_id = current_user.id
    if @game_comment.save
    render :game_comments
    end
  end

   def destroy
    GameComment.find(params[:id]).destroy
    @game = Game.find(params[:game_id])
    @game_comments = @game.game_comments.includes(:user).order(created_at: :desc)
    render :game_comments
   end

  def search
  @game_comments = GameComment.search(params[:word])
  @word = params[:word]
  end

  private
  def game_comment_params
    params.require(:game_comment).permit(:game_content, :game_id)
  end
end



