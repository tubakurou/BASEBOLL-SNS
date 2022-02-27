class Users::UsersController < ApplicationController

def show
  @user = User.find(params[:id])
  @game_comments = @user.game_comments.order(created_at: :desc).page(params[:page]).per(20)
  @game_comments.each do |game_comment|
    @game = game_comment.game
  end
end
def index
  @users = User.all
end

def edit
  @user = User.find(params[:id])
  if @user == current_user
    render "edit"
  else
    redirect_to user_path(current_user.id)
  end
end

def update
    @user = User.find(params[:id])
   if  @user.update(user_params)
       flash[:notice] = "have updated user successfully."
    redirect_to user_path(@user.id)
   else
    render :edit
   end
end

def quit
    @user = User.find(params[:id])
end

def out
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
end


private
  def user_params
    params.require(:user).permit(:nick_name, :team_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :profile, :user_image_id, :is_deleted)
  end
end

