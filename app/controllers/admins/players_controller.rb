class Admins::PlayersController < ApplicationController
  def  index
      # Categoryのデータベースのテーブルから一致するidを取得
      @team = Team.find(params[:team_id])

      # category_idと紐づく投稿を取得
      @players = @team.players.order(created_at: :desc).all
  end

  def show
  @player = Player.find(params[:id])
  @team = @player.team
  end

  def new
    @player = Player.new
    @teame = Team.all

  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to admins_team_players_path
    else
      render action: :new
    end
  end


  def edit
    @player = Player.find(params[:id])
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
    params.require(:player).permit(:player_image, :team_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :number, :dominant_pitch, :dominant_bat, :play_status, :order_status, :position_status, :run_status, :is_batting)
  end
end