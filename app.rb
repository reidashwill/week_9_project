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

post("/projects") do
  project_title = params[:project_title]
  project = Project.new({:title => project_title, :id => nil})
  project.save
  redirect to(('projects'))
end

get("/volunteers") do
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

post("/volunteers") do
  volunteer_name = params[:volunteer_name]
  volunteer = Volunteer.new({:name => volunteer_name, :id => nil, :project_id => })
  volunteer.save
  redirect to(('/volunteers'))
end


get("/projects/:id") do
  @project = Project.find(params[:id].to_i)
  erb(:project)
end

patch("/projects/:id") do
  @project = Project.find(params[:id].to_i)
  @project.update({:title => params[:project_title], :id => nil})
  redirect to("/projects")
end

delete("/projects/:id") do
  @project = Project.find(params[:id].to_i)
  @project.delete()
  redirect to("/projects")
end

