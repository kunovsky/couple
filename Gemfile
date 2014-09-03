source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use postgresql as the database for Active Record
gem 'pg'

gem 'pry-rails'
gem 'redis-rails'

#active record addons
gem 'bcrypt', '~> 3.1.7'
gem 'arel-helpers', git: 'https://github.com/camertron/arel-helpers.git'

gem 'debugger', group: [:development, :test]

group :development, :test, :staging do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "capybara"
  gem "bullet"
  gem 'rake'
  gem 'letter_opener'
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

#outside services
gem 'twilio-ruby'
gem 'sidekiq'
gem 'sidekiq_mailer'