Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
    with.library :action_controller
    # Or, choose all of the above:
    with.library :rails
  end
end