class MailBoxesController < ApplicationController
  before_action :authenticate_user!

  def show
    @mails = current_user.mail_box.messages
  end
end
# TODO index list messages from user's
# TODO show collection messages from user
