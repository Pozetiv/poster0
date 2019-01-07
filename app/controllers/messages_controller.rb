class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_convection

  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      redirect_to root_path, danger: "Opps we can't send messages"
    end
  end

  private

  def set_convection
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:comment).permit(:body)
  end
end
