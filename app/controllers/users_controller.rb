class UsersController < ApplicationController
  def show
    find_user
  end

  private

 def find_user
   @user = User.find(params[:id])
 end

  def user_params
  end
end
