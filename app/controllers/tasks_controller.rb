class TasksController < ApplicationController
  before_action :set_project

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.new(taks_params)
    if @task.save
      redirect_to @project, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def taks_params
    params.require(:task).permit(:name)
  end
end