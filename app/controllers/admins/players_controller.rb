class Admins::PlayersController < ApplicationController
  def  index
      @team = Team.find(params[:team_id])
      # team_idと紐づく投稿を取得
      @players = @team.players.order(created_at: :desc).all
  end

  def edit
   @player = Player.find(params[:id])
   @game_player = GamePlayer.new
   @team = Team.find(params[:id])
   @game = Game.where(game_status: 1)
   @games = @game.all
  end

  def new
    @player = Player.new
    @teame = Team.all

  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to admins_team_players_path(@player.team_id)
    else
      render action: :new
    end
  end


  def update
     @player = Player.find(params[:id])
    if @player.update(player_params)

     redirect_to admins_team_players_path
    else
      render action: :edit
    end
  end

  def destroy
  end

private
  def  player_params
    params.require(:player).permit(:player_image, :team_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :number, :dominant_pitch, :dominant_bat, :play_status, :order_status, :position_status, :run_status, :is_batting, :is_pitch)
  end

 def if_not_admin
    redirect_to root_path unless current_user.admin?
 end
end