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
  @projects = Project.all()
  erb(:projects)
end

post("/projects") do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save
  redirect to('/home')
end



post("/projects/:id/add_volunteer") do
  name = params[:name]
  @project = Project.find(params[:id].to_i)
  @volunteer = Volunteer.new({:name => name, :id => nil, :project_id => @project.id})
  @volunteer.save
  @volunteers = @project.volunteers
  erb(:project)
end

get("/projects/:id") do
  @project = Project.find(params[:id].to_i)
  @volunteers = @project.volunteers
  erb(:project)
end

patch("/projects/:id") do
  @project = Project.find(params[:id].to_i)
  @project.update({:title => params[:title], :id => nil})
  redirect to("/home")
end

delete("/projects/:id") do
  @project = Project.find(params[:id].to_i)
  @project.delete()
  redirect to("/home")
end

get("/volunteers") do
  @volunteers = Volunteer.all()
  erb(:volunteers)
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id].to_i)
  erb(:volunteer)
end

patch("/volunteers/:id") do
  @volunteer = Volunteer.find(params[:id].to_i)
  @volunteer.update({:name => params[:name], :id => @volunteer.id, :project_id => nil})
  erb(:volunteer)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i)
  @volunteers = @project.volunteers
  erb(:edit_project)
end

