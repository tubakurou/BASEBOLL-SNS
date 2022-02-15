class Users::GameCommentsController < ApplicationController
   def create
    @game_comment = current_user.game_comments.new(game_comment_params)
    if @game_comment.save
    redirect_to admins_gams_patch(@game)
    else
    redirect_to admins_gams_patch(@game)#コメント送信後は、一つ前のページへリダイレクトさせる。
    end
  end

  private
  def game_comment_params
    params.require(:game_comment).permit(:game_content, :game_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
end

end
