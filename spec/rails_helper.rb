# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/webkit/matchers'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.allow_url("ajax.googleapis.com")
  config.allow_url("code.highcharts.com")
  config.allow_url("openweathermap.org")
end
# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.infer_spec_type_from_file_location!
  
  config.use_transactional_fixtures = false
  #config.before :each, :js, type: :feature do |example|
    # Everything is terrible. js: true in config.before will run if the js tag
    # is present in the spec declaration, regardless of the value.

  config.before(:each) do |example|
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.include(Capybara::Webkit::RspecMatchers, :type => :feature)
end

