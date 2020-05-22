require 'rspec'
require 'pg'
require 'volunteer'
require 'project'
require 'pry'
require 'capybara'

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM projects *;")
    DB.exec("DELETE FROM volunteers *;")
  end
end