class ProjectChooser

  def initialize(projects)
    @projects = projects
    @choice = @projects.choice
  end

  def choose
    pickup_project
    return unless @project
    create_working_hour
    handle_once_a_day_project
    @project
  end

  private

  def pickup_project
    # TO DO: get the one direct from db
    pickup = Pickup.new(@choice)
    project_name = pickup.pick(1)
    @projects.each do |project|
      if project.name == project_name
        @project = project
        break
      end
    end
  end

  def create_working_hour
    WorkingHour.create(project: @project)
  end

  def handle_once_a_day_project
    if @project.once_a_day?
      @project.update_attributes current_weight: 0
    end
  end

end