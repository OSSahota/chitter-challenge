# Including what's needed to prepare Capybara & to get Capybara to test our app.
# set RACK_ENV to test
ENV['RACK_ENV'] = 'test'
# require our Sinatra app file (app.rb)
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require './app'
require 'capybara/rspec'
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

RSpec.configure do |config|
  config.after(:suite) do
    # puts
    # puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    # puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
