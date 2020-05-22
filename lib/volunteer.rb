class Volunteer
  attr_reader :id
  attr_accessor :name, :project_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @project_id = attributes.fetch(:project_id)
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}'RETURNING id, name, project_id;")
    @id = result.first().fetch("id").to_i
    @name = result.first().fetch("name")
    @project_id = result.first().fetch("project_id").to_i
  end


end