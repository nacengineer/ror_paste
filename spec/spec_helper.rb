require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rails'
require 'rspec/rails'
require 'rspec/autorun'
require 'rspec/mocks'
require 'capybara/rspec'
require 'factory_girl'
require 'factory_girl_rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.mock_with :rspec

  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # Request specs cannot use a transaction because Capybara runs in a
  # separate thread with a different database connection.
  config.before type: :request do
    DatabaseCleaner.strategy = :truncation
  end

  # Reset so other non-request specs don't have to deal with slow truncation.
  config.after type: :request  do
    DatabaseCleaner.strategy = :transaction
  end

  config.before do
    DatabaseCleaner.start
    ActionMailer::Base.deliveries.clear
  end

  config.after do
    DatabaseCleaner.clean
  end

  Capybara.javascript_driver = :webkit
  Capybara.ignore_hidden_elements = false

  Capybara.configure do |config|
    config.app_host   = 'http://127.0.0.1'
    config.server_port = 7000
  end
end
