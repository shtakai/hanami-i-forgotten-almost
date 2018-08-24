# Require this file for feature tests
require_relative './spec_helper'

require 'capybara'
require 'capybara/dsl'

# Capybara.app = Hanami.app

Capybara.app = ::Hanami::App
# class MiniTest::Spec
#   include Capybara::DSL
# end
