class Admins::GamesController < ApplicationController
   before_action :if_not_admin
 

  def index
    @game = Game.new
    @games = Game.all.page(params[:page])
  end

  def show
    @results = {}
    @teams = Team.all
    @game = Game.find(params[:id])
    @game_players = @game.game_players.includes(:player)
    @game_team = GameTeam.new
    @game_team_teams = @game.teams
    @team_results = TeamResult.new
    @game_team_results = @game.team_results.includes(:team)
    @game_teams = @game.game_teams
    @game_player = GamePlayer.new
  end

  def game_players
    @game = Game.find(params[:game_id])
    @team = Team.find(params[:team_id])
    @team_players = @team.players
    @team_players.each do |team_player|
      @game_players = team_player.game_players.where(game_id: @game.id,player_id: @team.players).order(created_at: :desc).page(params[:page]).per(20)
    end
  end

  def team_results
    @team = Team.find(params[:team_id])
    @game = Game.find(params[:game_id])
    @team_results =  @team.team_results.where(game_id: @game.id,team_id: @team.id).order(created_at: :desc).all.page(params[:page]).per(20)
  end

  def players
    @game = Game.find(params[:game_id])
    @team = Team.find(params[:team_id])
    @players = @team.players.order(created_at: :desc).all
  end

  def game_comments
    @game = Game.find(params[:game_id])
    @game_comments = @game.game_comments.includes(:user).order(created_at: :desc).page(params[:page]).per(20)
    @game_comment = GameComment.new
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
  def game_paraams
      params.require(:game).permit(:game_date, :stadium, :game_show, :game_status, :strike, :boll, :out, :game_time, :result_show, :innings)
  end
 def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
