class Admins::GamePlayersController < ApplicationControlle

   def create
    @game = Game.find_by(id: params[:id])
    @game_player = @game.game_players.create(player_id: params[:player_id])
    redirect_to admins_game_path(@game)
   end

  def update
    @game_player = Gameplayer.find(id: params[:id])
    if @game_player.update(game_player_params)
      redirect_to admins_game_path(@game)
    else
      render action: :show
    end
  end

 private
  def game_team_params
    params.require(:game_player).permit(:count, :lost, :results, :order_status, :position_status, :inning_status)
  end
end

