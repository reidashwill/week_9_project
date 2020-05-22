class Volunteer
  attr_reader :id
  attr_accessor :name, :project_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @project_id = attributes.fetch(:project_id)
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', '#{@project_id}') RETURNING id, name, project_id;")
    @id = result.first().fetch("id").to_i
    @name = result.first().fetch("name")
    @project_id = result.first().fetch("project_id").to_i
  end

  def ==(volunteer_to_compare)
    self.name() == volunteer_to_compare.name()
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers")
    volunteers = []
    returned_volunteers.each do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      project_id = volunteer.fetch("project_id").to_i
      volunteers.push(Volunteer.new({:name => name, :id => id, :project_id => project_id}))
    end
  volunteers
  end
  
  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};")
    name = volunteer.first().fetch("name")
    id = volunteer.first().fetch("id").to_i
    project_id = volunteer.first.fetch("project_id").to_i
    Volunteer.new({:name => name, :id => id, :project_id => project_id})
  end
  
  def self.find_by_project(pro_id)
    volunteers = []
    project_volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{pro_id}")
    project_volunteers.each do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      project_id = volunteer.fetch("project_id").to_i
      volunteers.push(Volunteer.new({:name => name, :id => id, :project_id => project_id}))
    end
    volunteers
  end
end