class Admins::GamePlayersController < ApplicationController

  def create
    @player = Player.find(params[:player_id])
    @game = Game.find(params[:game_id])
    @game_player = @player.game_players.create(game_id: params[:game_id])
    redirect_to edit_admins_team_player_path(params[:team_id],params[:player_id])
  end

  def update
    @game = Game.find(params[:id])
    @game_player = GamePlayer.find(params[:id])
    if @game_player.update(game_player_params)
      redirect_to admins_game_path(@game)
    else
      render action: :show
    end
  end

 private
  def game_player_params
    params.require(:game_player).permit(:boll_count, :point_lost, :bat_results, :order_status, :position_status)
  end
end

