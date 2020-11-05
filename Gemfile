source 'https://rubygems.org'

ruby '2.6.3'
gem 'rails', '4.2.6'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'# :require => false
  gem 'simplecov', :require => false
  gem 'rack_session_access'
end
group :production do
  gem 'pg' # for Heroku deployment
  gem 'rails_12factor'

end

# Gems used only for assets and not required
# in production environments by default.

  #gem 'therubyracer', '~> 0.12.0'
gem 'sass-rails', '~> 5.0.3'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '>= 2.7.1'

gem 'jquery-rails'
gem 'haml'
gem 'protected_attributes'


gem 'bootstrap-sass', '~> 3.4.1'
gem 'autoprefixer-rails'
gem 'less-rails'
gem 'therubyracer'


gem 'turbolinks'

gem 'omniauth-twitter'


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'
