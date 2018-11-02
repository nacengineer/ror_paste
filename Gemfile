source 'http://rubygems.org'

RAILS_VERSION = '~> 4.1.0'

gem 'rails', RAILS_VERSION

# add these gems to help with the transition:
gem 'protected_attributes'
gem 'rails-observers'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'
gem 'actionpack', RAILS_VERSION

# Bundle edge Rails instead:
# gem 'rails', :git => 'https://github.com/rails/rails.git'

gem 'sqlite3'
# gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.

gem 'sass-rails',    '~> 4.0.1'
gem 'coffee-rails',  '~> 4.0.1'
gem 'uglifier',      '~> 1.3.0'
gem "compass-rails", '~> 1.1.3'

gem 'bootstrap-sass'
gem 'bootstrap-will_paginate'
gem 'font-awesome-rails', '~> 4.0.3.1'
gem "ruby_badger"
gem "breadcrumbs_on_rails"
gem 'rails-bootstrap-markdown'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-ui-themes'
gem 'jquery-turbolinks'
gem 'yui-compressor'

gem 'turbolinks'

gem 'haml'
gem 'haml-rails'
gem 'simple_form', '~> 3.0.1'

gem 'dalli'

gem 'pygments.rb'
gem "github-linguist", "~> 7.0.0" , require: 'linguist'
gem "github-markup",   "~> 3.0.1",   require: 'github/markup'

gem 'redcarpet'
gem 'nokogiri'

gem 'manic_monkey', '~> 0.0.2'
gem 'guard-spork', group: :development, git: 'https://github.com/guard/guard-spork.git'

group :development do
  gem 'annotate'
  gem 'oink'
  gem 'hirb'
  # uncomment if you don't have js engine (node.js) on your system
  gem 'mini_racer'
end

group :development, :test do
  # gem 'trinidad', platform: :jruby
  # gem 'unicorn',  platform: :ruby
  # gem 'thin',     platform: :ruby
  gem 'puma',     platform: :ruby
  gem 'pry',      require: false
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'awesome_print'
  gem 'ruby_cowsay'
  gem 'sextant'
  gem 'rails3-generators'
  gem 'rspec', "~> 2.99.0"
  gem "rspec-rails"
  gem 'capybara'
end

group :production do
  # Use unicorn as the web server
  gem 'unicorn'
  # gem 'therubyracer'
end

group :test do
  # Pretty printed test output
  gem 'turn',      require: false
  gem 'simplecov', require: false
  gem 'factory_girl_rails'
  gem 'forgery'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-livereload'
  gem 'guard-brakeman'
  gem 'guard-coffeescript'
  gem 'database_cleaner', git: "https://github.com/tommeier/database_cleaner", branch: "fix-superclass"
  gem 'spork-rails', git: 'https://github.com/sporkrb/spork-rails.git'
  gem 'fuubar'
  # gem 'webmock'
  if RUBY_PLATFORM =~ /darwin/
    gem 'rb-fsevent','~> 0.9.1'
  elsif RUBY_PLATFORM =~ /linux/
    gem 'rb-inotify'
  end
end
