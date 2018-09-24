class ApplicationController < ActionController::Base
  add_flash_types :primary, :warning, :danger, :success, :info
end
