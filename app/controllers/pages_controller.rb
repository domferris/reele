class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # binding.pry
    if params[:query].present?
      @project_list = Category.find_by(name: params[:query]).projects
    else
      @project_list = Project.all

    end
  end

  def dashboard
    @user = current_user
  end
end

