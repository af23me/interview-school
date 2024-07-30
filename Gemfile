# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'dotenv-rails', '~> 2.8'
gem 'importmap-rails'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.2'
gem 'sassc', '2.4.0'
gem 'sprockets-rails'

# Hotwire"s SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# # Hotwire"s modest JavaScript framework [https://stimulus.hotwired.dev]
# gem "stimulus-rails"

gem 'bootsnap', require: false
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'activeadmin'
gem 'wicked_pdf'

group :development, :test do
  gem 'byebug', '11.1.3'
  gem 'factory_bot', '~> 6.2.1'
  gem 'ffaker', '~> 2.11'
  gem 'rspec-rails', '~> 6.0'
end

group :development do
  gem 'annotate', '~> 3.2.0'
  gem 'rubocop', '~> 1.37'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner-active_record', '~> 2.1.0'
  gem 'selenium-webdriver'
  gem 'simplecov', '~> 0.22.0', require: false
end
