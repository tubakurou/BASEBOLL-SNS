class Users::GamesController < ApplicationController

  def index
    @game = Game.where(game_status: 1)
  end

  def show
    @game = Game.find(params[:id])
    @game_teams = @game.game_teams
    @game_comments = @game.game_comments.includes(:user).order(created_at: :desc)
    @game_comment = GameComment.new
  end

  def game_comment
    @game = Game.find(params[:id])
    @game_comments = @game.game_comments
    @game_comment = GameComment.new
  end

 private
  def game_params
      params.require(:game).permit(:game_date, :stadium, :game_show, :game_status, :strike, :boll, :out, :game_time)
  end
end

