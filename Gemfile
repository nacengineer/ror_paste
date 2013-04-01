source 'http://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',              '~> 3.2.4'
  gem 'bootstrap-sass',          '~> 2.3.0.1'
  gem "font-awesome-sass-rails", '~> 2.0.0'
  gem 'coffee-rails',            '~> 3.2.2'
  gem 'jquery-ui-rails'
  gem 'jquery-rails'
  gem 'jquery-ui-themes'
  gem 'compass-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier',       '~>1.0.3'
  gem 'yui-compressor'
end

gem 'tinymce-rails', :git => 'git://github.com/nacengineer/tinymce-rails.git'

gem 'haml'
gem 'haml-rails'
gem 'simple_form'

gem 'pygments.rb'
gem "github-linguist", "~> 2.3.4" , require: 'linguist'
gem "github-markup",   "~> 0.7.4",  require: 'github/markup'
gem 'will_paginate',   '~> 3.0.0'
gem 'bootstrap-will_paginate'
gem 'redcarpet'
gem 'nokogiri'

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
  gem 'puma',     platform: :ruby
  # gem 'thin',     platform: :ruby
  # gem 'trinidad', platform: :jruby
  # gem 'unicorn',  platform: :ruby
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'awesome_print'
  gem 'rake'
  gem 'pry',       require: false
  gem 'better_errors'
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
  gem 'minitest'
  gem 'forgery'
  gem 'minitest'
  gem 'minitest-spec-rails'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-livereload'
  gem 'guard-brakeman'
  gem 'guard-coffeescript'
  gem 'guard-minitest'
  if RUBY_PLATFORM =~ /darwin/
    gem 'rb-fsevent','~> 0.9.1'
  elsif RUBY_PLATFORM =~ /linux/
    gem 'rb-inotify'
  end
  gem 'factory_girl_rails'
  gem 'mocha' , require: false #needed for stubbing out ability tests.
end
