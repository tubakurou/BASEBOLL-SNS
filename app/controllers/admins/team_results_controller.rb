class Admins::TeamResultsController < ApplicationController

   def create
     @team = Team.find(params[:team_id])
     @game = Game.find(params[:game_id])
     unless @team.team_results.where(game_id: @game.id).exists?(inning: params[:team_result][:inning]) #試合に紐づくチームが、同じ数を格納したイニングカラムを複数持たないようにする。
     @team_results = @team.team_results.new(team_results_params)
     @team_results.game_id = @game.id
     @team_results.save
     end
    redirect_to admins_game_path(params[:game_id])
   end

  def update
    @team_results = TeamResult.find(params[:id])
     @game = @team_results.game
    if @team_results.update(team_results_params)
      redirect_to admins_game_path(@game)
    else
      render action: :show
    end
  end

private
  def team_results_params
    params.require(:team_result).permit(:error,:score,:hit, :inning)
  end
end

