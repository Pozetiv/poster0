class UsersController < ApplicationController
  before_action :find_user

  def profile; end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
