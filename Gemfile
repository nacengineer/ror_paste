source 'http://rubygems.org'

gem 'rails', '~> 4.0.0'

# add these gems to help with the transition:
gem 'protected_attributes'
gem 'rails-observers'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'
gem 'actionpack', '~> 4.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.

gem 'sass-rails',     '~> 4.0.0'
gem 'coffee-rails',   '~> 4.0.0'
gem 'uglifier',       '~> 1.0.3'

gem 'bootstrap-sass', git: 'https://github.com/thomas-mcdonald/bootstrap-sass.git', branch: '3'
gem 'bootstrap-will_paginate'
gem 'font-awesome-rails'
gem "honey_badger", git: 'https://github.com/nacengineer/honey_badger.git', branch: 'rails-4'
gem "breadcrumbs_on_rails"
gem 'rails-bootstrap-markdown'


gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-ui-themes'
gem "compass-rails", "~> 2.0.alpha.0"
gem 'yui-compressor'


gem 'tinymce-rails'

gem 'haml'
gem 'haml-rails'
gem 'simple_form', '~>3.0.0.rc'

gem 'dalli'

gem 'pygments.rb'
gem "github-linguist", "~> 2.3.4" , require: 'linguist'
gem "github-markup",   "~> 0.7.4",  require: 'github/markup'

gem 'redcarpet'
gem 'nokogiri'

gem 'manic_monkey', '~> 0.0.2'
gem 'guard-spork', group: :development, github: 'guard/guard-spork'
gem 'rack-mini-profiler'

group :development do
  gem 'annotate'
  gem 'awesome_print'
  gem 'rails3-generators'
  gem 'oink'
  gem 'hirb'
  # uncomment if you don't have js engine (node.js) on your system
  # gem 'therubyracer'
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'capistrano_colors'
  gem 'rvm'
  gem 'rvm-capistrano'
end

group :development, :test do
  gem 'sqlite3'
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
  gem 'rspec'
  gem "rspec-rails", "~> 2.0"
  gem 'capybara'
  gem 'ruby-prof'
  gem 'perftools.rb', git: 'git://github.com/tmm1/perftools.rb.git'
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
  gem 'database_cleaner', :git => "https://github.com/tommeier/database_cleaner", branch: "fix-superclass"
  gem 'rack-perftools_profiler', require: 'rack/perftools_profiler'
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'fuubar'
  # gem 'webmock'
  if RUBY_PLATFORM =~ /darwin/
    gem 'rb-fsevent','~> 0.9.1'
  elsif RUBY_PLATFORM =~ /linux/
    gem 'rb-inotify'
  end
end
