class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @user = User.find_by_username(params[:username])
    @published_projects = @user.projects.select { |p| p.published == true }
  end
end
