class ProjectsController < ApplicationController
  def index

  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def project_params

  end

  def find_project
    @project = Project.new(params[:id])
  end
end
