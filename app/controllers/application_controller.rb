class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_public?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :profile, :fan_team, :phone_number])
  end

  def after_sign_in_path_for(resource)
    case resource
      when User
      user_posts_path
      when Admin
      admin_user_posts_path
    end
  end
end

