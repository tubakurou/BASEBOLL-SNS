class Admins::GamesController < ApplicationController

  def index
    @game = Game.new
    @games = Game.all.page(params[:page]) #
  end

  def show
    @teams = Team.all
    @game = Game.find(params[:id])
    @game_players = @game.game_players
    @game_team = GameTeam.new
    @game_team_teams = @game.teams
    @team_results = TeamResult.new
    @game_teams = @game.game_teams
  end

  def game_players
    @team = Team.fond(params[:team_id])
    @game = Game.find(params[:game_id])
    @team = Team.fond(params[:team_id])
    @game_players = @game.teams.game_players.includes(:player).order(created_at: :desc).all
  end
  
  def team_results
    @game = Game.find(params[:game_id])
    @team_results = @game.team_results.includes(:team)
  end

  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to admins_games_path
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to admins_game_path(@game)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to admins_team_path
  end


private
  def game_params
      params.require(:game).permit(:game_date, :stadium, :game_show, :game_status, :strike, :boll, :out, :game_time)
  end
end