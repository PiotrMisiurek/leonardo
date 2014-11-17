class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:update, :destroy]

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

  def update
    @task.update_attribute :done, true
    redirect_to @project, notice: 'Task was successfully marked as done.'
  end

  def destroy
    @task.destroy
    redirect_to @project, notice: 'Task was successfully removed'
  end

  private

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def taks_params
    params.require(:task).permit(:name)
  end
end