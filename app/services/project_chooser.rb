class ProjectChooser

  def initialize(projects)
    @projects = projects
    @choice = @projects.choice
  end

  def choose
    # TO DO: get the one direct from db
    pickup = Pickup.new(@choice)
    project_name = pickup.pick(1)
    @projects.find_by_name(project_name)
  end

end