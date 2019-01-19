class TrendsMonthWorker
  include Sidekiq::Worker

  def perform
    User.find_each do |user|
      UserSubscribesMailer.trend_month(user.id).deliver_now
    end
  end
end
