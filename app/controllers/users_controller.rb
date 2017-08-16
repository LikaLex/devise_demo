class UsersController < ApplicationController
  before_action :load_user, only: [:destroy, :block, :unblock]

  def index
    @users = User.all
  end

  def destroy
    @user.destroy unless @user == current_user
    flash['notice'] = "#{@user.email} was successfully removed"
    redirect_to users_path
  end

  def block
    @user.update(blocked_at: Time.now) unless @user == current_user
    redirect_to users_path
  end

  def unblock
    @user.update(blocked_at: nil) unless @user == current_user
    redirect_to users_path
  end

  private

  def load_user
    @user = User.find(params[:id])
  end
end
