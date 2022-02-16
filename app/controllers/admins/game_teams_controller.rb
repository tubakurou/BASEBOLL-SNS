class Admins::GameTeamsController < ApplicationController

   def create
    @game = Game.find_by(id: params[:id])
    @game_team = @game.game_teams.create(team_id: params[:team_id])
    redirect_to admins_game_path(@game)
   end

  def update
   @game = Game.find_by(id: params[:id])
    if @game_team = @game.game_teams.update(team_id: params[:team_id])
       redirect_to admins_game_path(@game)
    else
      render action: :show
    end
  end

  def destroy
    @game = Game.find_by(id: params[:id])
    @game_team = GameTeam.find_by(team_id: params[:team_id], game_id: @game.id)
    @game_team.destroy
    redirect_to admins_game_path(@game)
  end



 private
    def set_game
      @game = game.find(params[:id])
    end

  def game_team_params
    params.require(:game_team).permit(:is_affters, :is_attacks)
  end
end
