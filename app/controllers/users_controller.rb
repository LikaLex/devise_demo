class UsersController < ApplicationController
  before_action :test

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    User.destroy(@user)
    flash['notice'] = "#{@user.email} was successfully removed"
    redirect_to users_path
  end

  def block
    @user = User.find(params[:id])
    @user.update(blocked_at: Time.now)
    redirect_to users_path
  end

  private

  def test
    puts "ololo"
  end
end
