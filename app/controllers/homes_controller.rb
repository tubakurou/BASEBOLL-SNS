class HomesController < ApplicationController
  def top
    @games = Game.where(game_date: Time.zone.today)
    @results = {}
    @games.each do |game|
      ahead_team = game.game_teams.find_by(is_afters: false).team
      after_team = game.game_teams.find_by(is_afters: true).team
      ahead_score = ahead_team.team_results.where(game_id: game).sum(:score)
      after_score = after_team.team_results.where(game_id: game).sum(:score)
    @results[game.id]={
      ahead_team_name:ahead_team.team_name, ahead_team:ahead_team,
      after_team_name:after_team.team_name, after_team:after_team, ahead_score:ahead_score, after_score:after_score
     }#トップ画面に必要なデータを先攻、後攻ごとに@results[game.id]に格納
    end
  end
end

