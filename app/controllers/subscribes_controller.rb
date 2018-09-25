class SubscribesController < ApplicationController
  def create
    @subscribe = current_user.subscribes.new(subscribes_params)
    if @subscribe.save
      flash.now[:success] = 'Added'
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
