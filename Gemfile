source 'https://rubygems.org'

ruby "2.2.2"

# Bundle should be stated here in order to rails-assets to work
gem 'bundler', '>= 1.8.4'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Rails assets configuration - https://rails-assets.org
source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-fontawesome'
  gem 'rails-assets-routerrouter'
  gem 'rails-assets-angular'
  gem 'rails-assets-JumpLink--angular-toggle-switch'
  gem 'rails-assets-angular-xeditable'
end

# User authentication
gem 'devise'

# HTML markup
gem 'haml', '~> 4.0.5'

# Google fonts
gem 'google-webfonts'

# Angular templates on asset pipeline
gem 'angular-rails-templates'

# Organize lists by priority
gem 'acts_as_list'

# Heroku to work properly
gem 'rails_12factor', group: :production

# Environmental variables
gem 'figaro'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rspec-rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end

