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
gem 'rails', '>= 7.0.8.4', ENV.fetch('RAILS_VERSION'
gem 'tiny_tds'

group :development do
  gem 'brakeman', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'yard', require: false
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
  gem 'webmock'
  gem 'webrick'
end

group :production do
  gem 'aws-sdk-s3', require: false
end
