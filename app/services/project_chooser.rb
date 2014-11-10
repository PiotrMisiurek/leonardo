class ProjectChooser

  def initialize(projects)
    @projects = projects
    @choice = @projects.choice
  end

  def choose
    pickup_project
    create_working_hour
    @project
  end

  private

  def pickup_project
    # TO DO: get the one direct from db
    pickup = Pickup.new(@choice)
    project_name = pickup.pick(1)
    @project = @projects.find_by_name(project_name)
  end

  def create_working_hour
    WorkingHour.create(project: @project)
  end

end