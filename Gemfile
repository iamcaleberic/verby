source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'json', github: 'flori/json', branch: 'v1.8'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'webpacker', '~> 3.0'
gem 'mysql2'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'public_activity'
gem 'paperclip'
gem 'haml-rails'
gem "erb2haml", :group => :development
gem 'font-awesome-sass'
gem 'ckeditor'
gem 'devise'
gem 'rails_12factor'
gem 'rails_admin', '~> 1.2'
gem 'social-share-button'
gem 'figaro'
gem 'cancancan'
gem 'friendly_id'
gem 'jquery-turbolinks'
gem 'capistrano'
gem 'capistrano-rvm'
gem 'capistrano-bundler'
gem 'will_paginate'
gem 'acts_as_votable'
gem 'redis-rails'
gem 'acts_as_commentable_with_threading'
gem 'capistrano-yarn'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capistrano-rails'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
	gem 'minitest'
	gem 'minitest-reporters'
	gem 'mini_backtrace'
	gem 'guard'
	gem 'guard-minitest'
  gem 'rspec-rails', '~> 3.6'
  #
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
