# Including what's needed to prepare Capybara & to get Capybara to test our app.
# set RACK_ENV to test
ENV['RACK_ENV'] = 'test'
# require our Sinatra app file (app.rb)
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require './app'
require 'capybara/rspec'
require 'database_cleaner'
require 'simplecov'
require 'simplecov-console'
# tell Capybara about our app class: MessageBoard
Capybara.app = App

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  # Reference: https://github.com/DatabaseCleaner/database_cleaner
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
