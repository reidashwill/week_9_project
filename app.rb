require('sinatra')
require("sinatra/reloader")
require('pry')
require('pg')
require('./lib/project')
require('./lib/volunteer')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/')do
  redirect to('/home')
end

get('/home') do
  erb(:index)
end

get('/projects') do
  @projects = Project.all()
  erb(:projects)
end

get("/volunteers") do
  @volunteers = Volunteer.all()
  erb(:volunteers)
end