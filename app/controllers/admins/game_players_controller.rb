class Admins::GamePlayersController < ApplicationController
  def create
    @player = Player.find(params[:player_id])
    @game = Game.find(params[:game_id])
    @game_player = GamePlayer.new(game_players_params)
    @game_player.save(game_players_params)
     redirect_to request.referer
  end

  def update
    @game_player = GamePlayer.find(params[:id])
    @game_player.update(game_player_params)
    redirect_to request.referer
  end

  def destroy
    @game_player = GamePlayer.find(params[:id])
     @game_player.destroy
    redirect_to request.referer
  end

 private
  def game_player_params
     params.require(:game_player).permit(:inning, :boll_count, :point_lost, :bat_results, :order_status, :position_status, :game_id, :player_id)
  end

  def game_players_params
     params.permit(:inning, :boll_count, :point_lost, :bat_results, :order_status, :position_status, :game_id, :player_id)
  end
end

