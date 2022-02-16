class Users::GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @game_comments = @game.game_comments
    @game_comment = GameComment.new
  end

  def game_comment
    @game = Game.find(params[:id])
    @game_comments = @game.game_comments
    @game_comment = GameComment.new
  end
end

 private
  def game_params
    params.require(:game).permit(:game_content)
  end
