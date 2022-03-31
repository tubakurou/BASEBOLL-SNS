class Users::GamesController < ApplicationController

  def index
    @results = {}
    @games = Game.all.page(params[:page]).per(10)
    @games.each do |game|
      ahead_game = game.game_teams.find_by(is_afters: false)
      ahead_team = ahead_game&.team
      after_team = game.game_teams.find_by(is_afters: true)&.team
      unless ahead_team.nil?
        ahead_score = ahead_team.team_results.where(game_id: game).sum(:score)
      end
      unless after_team.nil?
        after_score = after_team.team_results.where(game_id: game).sum(:score)
      end

        @results[game.id]={
          ahead_is_attacks:ahead_game&.is_attacks, ahead_team_name:ahead_team&.team_name, ahead_team:ahead_team,
          after_team_name:after_team&.team_name, after_team:after_team, ahead_score:ahead_score, after_score:after_score
         }#トップ画面に必要なデータを先攻、後攻ごとに@results[game.id]に格納
    end
  end

  def show
    @game = Game.find(params[:id])
    @game_players = @game.game_players
    @game_teams = @game.game_teams
    @game_comments = @game.game_comments.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
    @game_comment = GameComment.new
    @ahead_team = @game.game_teams.find_by(is_afters: false)&.team
    @after_team = @game.game_teams.find_by(is_afters: true)&.team
    @ahead_players =  @ahead_team&.players
    @ahead_players&.each do |ahead_player|
      @ahead_game_players = ahead_player.game_players.where(game_id: @game.id)
    end
    @ahead_results = TeamResult&.where(game_id: @game.id,team_id: @ahead_team&.id).order(:inning)
    @ahead_score = @ahead_results&.sum(:score)
    @ahead_hit = @ahead_results&.sum(:hit)
    @ahead_error = @ahead_results&.sum(:error)
    @after_players =  @after_team&.players
    @after_players&.each do |after_player|
      @after_game_players = after_player.game_players.where(game_id: @game.id)
    end
    @after_results = TeamResult.where(game_id: @game.id,team_id: @after_team&.id).order(:inning)
    @after_score = @after_results&.sum(:score)
    @after_hit = @after_results&.sum(:hit)
    @after_error = @after_results&.sum(:error)
    @after_boll_count = @after_game_players&.sum(:boll_count)
    @after_point_lost = @after_game_players&.sum(:point_lost)
    @ahead_boll_count = @ahead_game_players&.sum(:boll_count)
    @ahead_point_lost = @ahead_game_players&.sum(:point_lost)
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

  def game_comments
    @game = Game.find(params[:game_id])
    @game_comments = @game.game_comments.includes(:user).order(created_at: :desc).page(params[:page]).per(20)
    @game_comment = GameComment.new
  end

  def search
  @game_comments = GameComment.search(params[:word])
  @word = params[:word]
  end

 private
  def game_params
      params.require(:game).permit(:game_date, :stadium, :game_show, :game_status, :strike, :boll, :out, :game_time)
  end
end

