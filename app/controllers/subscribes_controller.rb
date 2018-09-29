class SubscribesController < ApplicationController
  before_action :authenticate_user!

  def create
    @subscribe = current_user.subscribes.new(community_id: params[:community_id])
      if @subscribe.save
        redirect_to root_path
      else

      end
  end

    def destroy
      if @subscribe.destroy
        flash.now[:success] = "Unsubscribed"
      else

      end
    end
end
