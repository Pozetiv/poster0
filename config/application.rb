require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Poster
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.cache_store =  :redis_store, { host: "localhost", port: 6379, db: 15 }, { expires_in: 90.minutes }
    config.session_store :redis_store, servers: ["redis://localhost:6379/0/session"],expire_after: 90.minutes,
      key: "_#{Rails.application.class.parent_name.downcase}_session", threadsafe: false
  end
end
