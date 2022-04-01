class Users::TeamsController < ApplicationController
  def index
    @team = Team.all
  end
  
  def show
    @team = Team.params[team]
    @prayers = Team.players
  end
end
