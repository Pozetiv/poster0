class MailBoxesController < ApplicationController
  before_action :authenticate_user!

  def show
    @mails = current_user.mail_box.messages
  end
end
index list messages from user's
show collection messages from user