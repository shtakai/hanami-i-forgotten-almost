# Require this file for unit tests
ENV['HANAMI_ENV'] ||= 'test'

require_relative '../config/environment'
# require 'minitest/autorun'
require 'rspec/hanami'
require 'capybara'
require 'capybara/dsl'

RSpec.configure do |config|
  config.include RSpec::Hanami::Matchers
  config.include RSpec::Hanami::RequestHelpers
  # ...
end

Hanami.boot
Capybara.app = ::Hanami::App
