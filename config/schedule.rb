job_type :sidekiq, "cd :path && :environment_variable=:environment bundle exec sidekiq-client push :task :output"

every 1.month, at: 'start of the month at 1am', :roles => [:app] do
  sidekiq 'TrendsMonthWorker'
end