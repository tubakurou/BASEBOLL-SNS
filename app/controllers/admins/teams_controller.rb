class Admins::TeamsController < ApplicationController

  def index
    @team = Team.new
    @teams = Team.all
  end


  def create
    @team = Team.new(team_params)
    @team.save
    redirect_to admins_teams_path
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to admins_teams_path
  end

   def destroy
    @team= Team.find(params[:id])
    @team.destroy
    redirect_to admins_teams_path
   end


  private
  def team_params
       params.require(:team).permit(:team_name,:team_image)
  end
end
