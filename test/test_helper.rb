require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require 'minitest/autorun'
require 'minitest/spec'
# Uncomment if you want awesome colorful output
require "minitest/pride"
require 'rails'
require 'rails/test_help'


# Add `gem "minitest/rails/capybara"` to the test group of your Gemfile
# and uncomment the following if you want Capybara feature tests
# require "minitest/rails/capybara"

class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end

# class MiniTest::Spec::Rails::Model
# end

# class MiniTest::Spec::Rails::Controller
#   # Add methods to be used by controller specs here
# end

# class MiniTest::Spec::Rails::Helper
#   # Add methods to be used by helper specs here
# end

# class MiniTest::Spec::Rails::Mailer
#   # Add methods to be used by mailer specs here
# end

class MiniTest::Spec::Rails::Integration
  include Rails.application.routes.url_helpers
  # Add methods to be used by integration specs here
end

# include Devise::TestHelpers

class DateTime
  include Comparable
end

# use awesome print
require 'awesome_print'

module MiniTest::Assertions
  def mu_pp(obj)
    obj.awesome_inspect
  end
end
