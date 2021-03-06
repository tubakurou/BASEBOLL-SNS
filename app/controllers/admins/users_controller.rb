class Admins::UsersController < ApplicationController
 before_action :if_not_admin
  
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


private
  def user_params
    params.require(:user).permit(:team_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :profile, :user_image_id, :is_deleted)
  end
  
  def if_not_admin
    if user_signed_in? && current_user.admin?
    redirect_to root_path unless current_user.admin?
    end
  end
end

