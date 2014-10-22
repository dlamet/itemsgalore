ENV["RAILS_ENV"] ||= 'test'

require 'simplecov'
SimpleCov.start

require 'rspec'
require 'capybara/rspec'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'database_cleaner'
require_relative 'support/factory_girl'
require_relative 'support/controller_macros'
Rails.logger.info 'Running rails_helper.rb with Rails.'

include ControllerMacros

$:.unshift File.join(File.expand_path('../../', __FILE__))

RSpec.configure do |config|
  config.order = 'random'
  config.infer_spec_type_from_file_location!

  config.include Devise::TestHelpers, :type => :controller

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end