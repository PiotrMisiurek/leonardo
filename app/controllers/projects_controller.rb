class ProjectsController < ApplicationController
  before_action :check_working_hour_in_progress, only: :choose
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_projects, only: [:index, :choose]

  def new
    @project = current_user.projects.new
  end

  def choose
    @project = ProjectChooser.new(@projects).choose
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to projects_url, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to projects_url, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

    def check_working_hour_in_progress
      if working_hour = current_user.working_hours.in_progress.first
        redirect_to projects_url, notice: "You can not choose new project. #{working_hour.project.name} project is in progress"
      end
    end

    def set_project
      @project = current_user.projects.find(params[:id])
    end

    def set_projects
      @projects = current_user.projects
    end

    def project_params
      params.require(:project).permit(:name, :weight)
    end
end
