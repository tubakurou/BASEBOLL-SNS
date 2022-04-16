class Users::TeamsController < ApplicationController
  def index
    @team = Team.all
  end
  
  def show
    @team = Team.params[team]
    @players = Team.players
  end
end
