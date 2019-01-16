source 'https://rubygems.org'

# Commented out as return following error when executing bundle command:
# `validate_ruby!': Your Ruby version is 2.5.1, but your Gemfile specified 2.5.0 (Bundler::RubyVersionMismatch)
# ruby '2.5.0'
gem 'pg'
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'rake'
gem 'rubocop', '0.56.0'

group :test do
  gem 'capybara'
  # gem 'capybara/rspec'
  gem 'database_cleaner'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
