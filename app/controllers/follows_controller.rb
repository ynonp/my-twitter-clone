class FollowsController < ApplicationController
  before_action :require_login

  def create
    user = User.find(params[:id])
    current_user.follow(user)
    flash[:notice] = "You are now following #{user.username}"
    redirect_to root_path
  end

  def destroy
    user = User.find(params[:id])
    current_user.unfollow(user)
    flash[:notice] = "You unfollowed #{user.username}"
    redirect_to root_path
  end
end
