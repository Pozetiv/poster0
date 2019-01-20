class UserSubscribesMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  def trend_month(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "Hello #{@user.nick} it's your monthly top posts") 
  end
end
