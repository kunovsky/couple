source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use postgresql as the database for Active Record
gem 'pg'

gem 'pry-rails'
gem 'redis-rails'
gem 'therubyracer'

#active record addons
gem 'bcrypt', '~> 3.1.7'
gem 'arel-helpers', git: 'https://github.com/camertron/arel-helpers.git'

group :development do
  gem 'letter_opener'
end

group :development, :test do
  gem 'debugger'
  gem 'dotenv-rails'
  gem 'capistrano', '~> 3.2.0'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
end

group :development, :test, :staging do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "capybara"
  gem "bullet"
  gem 'rake'
end

#assets
gem 'sass'
gem 'sass-rails',   '~> 4.0.3'
gem 'coffee-rails', '~> 4.0'
gem 'bower-rails'
gem 'haml_coffee_assets', git: "https://github.com/netzpirat/haml_coffee_assets"
gem 'execjs'
gem "compass-rails"
gem 'uglifier'
gem 'haml'
gem 'active_model_serializers'

gem 'twilio-ruby'

gem 'thin'
gem 'sidekiq'
gem 'sidekiq_mailer'