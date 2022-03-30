class Users::PlayersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @players = @team.players.all
  end

  def show
    @player = Player.find(params[:id])
  end

end
