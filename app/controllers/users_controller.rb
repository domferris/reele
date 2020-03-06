class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:username])
    @featured = @user.projects.select { |p| p.published == true }
  end
end
