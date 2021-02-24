# frozen_string_literal: true

# SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
#   SimpleCov::Formatter::Console,
#   # Want a nice code coverage website? Uncomment this next line!
#   # SimpleCov::Formatter::HTMLFormatter
# ])

require_relative './setup_test_database'

ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'

SimpleCov.start

Capybara.app = BookmarkManager
