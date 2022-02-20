class Admins::TeamResultsController < ApplicationController

   def create
     @team = Team.find(params[:team_id])
     @team_results = @team.team_results.create(game_id: params[:game_id])
    redirect_to admins_game_path(params[:game_id])
  end


  end

 def update
    @team_results = TeamResult.find(id: params[:id])
    if @team_results.update(team_results_params)
      redirect_to admins_game_path(@game)
    else
      render action: :show
    end
  end

 private
  def team_results_params
    params.require(:game_player).permit(:error,:score,:hit)
  end

