# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

gem 'activerecord-sqlserver-adapter'
gem 'bootsnap', require: false
gem 'devise', '>= 4.9.0'
gem 'faker'
gem 'image_processing'
gem 'mysql2'
gem 'oj'
gem 'pg'
gem 'puma'
gem 'rails', '>= 7.1.0', ENV.fetch('RAILS_VERSION'
gem 'tiny_tds'

group :development do
  gem 'brakeman', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', '>= 2.17.4', require: false
  gem 'rubocop-rspec', require: false
  gem 'yard', '>= 0.9.29', require: false
end

group :development, :test do
  gem 'factory_bot_rails', '>= 6.3.0'
  gem 'letter_opener'
  gem 'pry-rails'
  gem 'simplecov', require: false
  gem 'sqlite3'
end

group :test do
  gem 'capybara', '>= 3.39.0'
  gem 'cuprite', '>= 0.15'
  gem 'rspec-rails', '>= 6.0.2'
  gem 'webmock', '>= 3.19.0'
  gem 'webrick', '>= 1.8.2'
end

group :production do
  gem 'aws-sdk-s3', require: false
end
