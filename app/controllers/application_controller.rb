class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :primary, :warning, :danger, :success, :info
  before_action :set_online_user

  rescue_from ActiveRecord::RecordNotFound  do
    render file: 'public/404.html', status: 404
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nick, :avatar])
  end

  def set_online_user
    $redis.set(current_user.id, nil, ex: 10*60) if current_user
  end

  def admin
    unless current_user.admin?
      redirect_to root_path, info: 'Sorry you are not from administration site'
    end
  end
end
