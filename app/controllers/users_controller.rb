class UsersController < ApplicationController
  before_action :load_user, only: [:destroy, :block, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy unless @user == current_user
    flash['notice'] = "#{@user.email} was successfully removed"
    redirect_to users_path
  end

  def block
    @user = User.find(params[:id]) unless @user == current_user
    @user.update(blocked_at: Time.now)
    redirect_to users_path
  end

  private

  def load_user
    @user = User.find(params[:id])
  end
end
