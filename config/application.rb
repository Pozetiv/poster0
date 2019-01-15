require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module Poster
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.cache_store =  :redis_store, { host: ENV['REDIS_HOST'], port: ENV['REDIS_PORT'], db: 15 }, { expires_in: 90.minutes }
    config.session_store :redis_store, servers: [ENV['REDIS_URL']] ,expire_after: 90.minutes,
      key: "_#{Rails.application.class.parent_name.downcase}_session", threadsafe: false
  end
end
