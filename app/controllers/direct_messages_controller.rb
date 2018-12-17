class DirectMessagesController < ApplicationController
  before_action :current_mail_box, except: [:destroy]

  def new
    @message = @mail_box.messages.new
  end

  def create 
    @message = @mail_box.messages.new(direct_messages_params)
    @message.user_id = current_user.id
    if @message.save 
      redirect_back(fallback_location: root_path)
      flash[:success] = 'Messege sended'
    else
      render :new
    end
  end

  def destroy
    @message = Comment.find(params[:id])
    if @message.delete
      redirect_back(fallback_location: root_path)
      flash[:success] = 'Message delete'
    else
      redirect_back(fallback_location: root_path)
      flash[:warning] = "Opps we're heve a problems"
    end
  end

  private 

  def direct_messages_params
    params.require(:comment).permit(:body)
  end
  
  def current_mail_box
    @mail_box = MailBox.find_by_user_id(params[:user_id])
  end
end
##TODO think about dialog dor message
