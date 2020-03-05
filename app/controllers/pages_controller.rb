class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      @project_list = Project.where(categories: params[:query])
    else
      @project_list = Project.all
    end
  end

  def dashboard
    @user = current_user
  end
end

