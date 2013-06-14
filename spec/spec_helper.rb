require 'rubygems'
require 'spork'
# uncomment the following line to use spork with the debugger
# require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  ENV["RAILS_ENV"] ||= 'test'

  unless ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  require File.expand_path("../../config/environment", __FILE__)
  require 'rails'
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'rspec/mocks'
  # require 'capybara/rspec'
  # require 'webmock/rspec'
  require 'factory_girl'
  require 'factory_girl_rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
    config.include Rails.application.routes.url_helpers
    config.mock_with :rspec

    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"

    # Capybara.javascript_driver = :webkit
    # Capybara.ignore_hidden_elements = false

    # Capybara.configure do |config|
    #   config.app_host   = 'http://127.0.0.1'
    #   config.server_port = 7000
    # end

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

    # This code will be run each time you run your specs.
    config.before do
      DatabaseCleaner.start
      # WebMock.disable_net_connect!(:allow_localhost => true)
      ActionMailer::Base.deliveries.clear
    end

    config.after do
      DatabaseCleaner.clean
    end

    config.before(:all) do
      DeferredGarbageCollection.start
    end

    config.after(:all) do
      DeferredGarbageCollection.reconsider
    end

    config.before :suite do
      PerfTools::CpuProfiler.start("#{profile_directory}/rspec_profile")
    end

    config.after :suite do
      PerfTools::CpuProfiler.stop
    end

    def profile_directory
      directory = "/tmp/#{Rails.application.class.parent_name}"
      system("mkdir #{directory}") unless Dir.exist? directory
      directory
    end

  end
end

Spork.each_run do
  if ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end
  FactoryGirl.reload
  RSpec.configure do |config|
    def svg_filename
      "#{Rails.root}/tmp/profile-#{Time.now.localtime.strftime("%H%M%S")}.svg"
    end
  end
end

# --- Instructions ---
# Sort the contents of this file into a Spork.prefork and a Spork.each_run
# block.
#
# The Spork.prefork block is run only once when the spork server is started.
# You typically want to place most of your (slow) initializer code in here, in
# particular, require'ing any 3rd-party gems that you don't normally modify
# during development.
#
# The Spork.each_run block is run each time you run your specs.  In case you
# need to load files that tend to change during development, require them here.
# With Rails, your application modules are loaded automatically, so sometimes
# this block can remain empty.
#
# Note: You can modify files loaded *from* the Spork.each_run block without
# restarting the spork server.  However, this file itself will not be reloaded,
# so if you change any of the code inside the each_run block, you still need to
# restart the server.  In general, if you have non-trivial code in this file,
# it's advisable to move it into a separate file so you can easily edit it
# without restarting spork.  (For example, with RSpec, you could move
# non-trivial code into a file spec/support/my_helper.rb, making sure that the
# spec/support/* files are require'd from inside the each_run block.)
#
# Any code that is left outside the two blocks will be run during preforking
# *and* during each_run -- that's probably not what you want.
#
# These instructions should self-destruct in 10 seconds.  If they don't, feel
# free to delete them.
