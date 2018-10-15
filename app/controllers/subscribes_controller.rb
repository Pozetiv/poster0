class SubscribesController < ApplicationController
  before_action :authenticate_user!

  def index
    @subcribes = current_user.subscribes
  end

  def create
    @subscribe = current_user.subscribes.new(community_id: params[:community_id])
      if @subscribe.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
  end

    def destroy
      if @subscribe.destroy
        flash.now[:success] = "Unsubscribed"
        redirect_back(fallback_location: root_path)
      else
      end
    end
end
