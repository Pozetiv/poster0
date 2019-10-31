source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'redis', '~> 4.0', '>= 4.0.2'
gem 'hiredis'
gem 'redis-namespace'
gem 'redis-rails'
gem 'redis-rack-cache'

gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem "letter_opener"
  gem "launchy"
  gem "timecop"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
end

gem 'bootstrap', '~> 4.1', '>= 4.1.3'
gem 'jquery-rails'
gem 'haml', '~> 5.0', '>= 5.0.4'
gem 'simple_form', '~> 4.0', '>= 4.0.1'
gem 'devise', '~> 4.7'
gem 'carrierwave', '~> 1.0'
gem 'acts_as_votable', '~> 0.11.1'
gem 'friendly_id'
gem "cocoon"
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap4'
gem 'active_record_union'
gem 'sidekiq'
gem 'sidekiq-client-cli'
gem 'whenever', require: false