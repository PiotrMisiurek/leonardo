class ProjectChooser

  def initialize
    @choice = Project.choice
  end

  def choose
    # TO DO: get the one direct from db
    pickup = Pickup.new(@choice)
    project_name = pickup.pick(1)
    Project.find_by_name(project_name)
  end

end