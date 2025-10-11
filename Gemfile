# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

gem 'activerecord-sqlserver-adapter', '>= 8.0.8'
gem 'bootsnap', require: false
gem 'devise'
gem 'faker'
gem 'image_processing'
gem 'mysql2'
gem 'oj'
gem 'pg'
gem 'puma'
gem 'rails', '>= 8.0.3', ENV.fetch('RAILS_VERSION'
gem 'tiny_tds'

group :development do
  gem 'brakeman', require: false
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', '>= 2.33.4', require: false
  gem 'rubocop-rspec', require: false
  gem 'yard', require: false
end

group :development, :test do
  gem 'factory_bot_rails', '>= 6.5.1'
  gem 'letter_opener'
  gem 'pry-rails'
  gem 'simplecov', require: false
  gem 'sqlite3'
end

group :test do
  gem 'capybara'
  gem 'cuprite'
  gem 'rspec-rails'
  gem 'webmock'
  gem 'webrick'
end

group :production do
  gem 'aws-sdk-s3', require: false
end
