class Users::GameCommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @game_comment = GameComment.new(game_comment_params)
    @game_comment.game_id = @game.id
    @game_comment.user_id = current_user.id
    if @game_comment.save
    redirect_to game_path(@game)
    else
    redirect_to game_path(@game)
    end
  end
  
   def destroy
    BookComment.find_by(id: params[:id], game_id: params[:game_id]).destroy
     @game = Game.find(params[:game_id])
    render :game_comments
  end


  private
  def game_comment_params
    params.require(:game_comment).permit(:game_content, :game_id)
  end
end



