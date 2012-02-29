ENV['RACK_ENV'] = "test"
require File.expand_path("../../../config/environment", __FILE__)
require 'capybara/rails'
require 'capybara/rspec'
require 'shoulda/matchers/active_record'
require 'shoulda/matchers/active_model'

Capybara.app = Rack::Builder.parse_file('./config.ru').first

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before :all do
    ActiveRecord::Base.logger = false
  end

  config.after :all do
    ActiveRecord::Base.connection.tables.each do |table|
      unless ['schema_migrations'].include?(table)
        ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
        ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'")
      end
    end
    ActiveRecord::Base.connection.execute("VACUUM")
  end
end
