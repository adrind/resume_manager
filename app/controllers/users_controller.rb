class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'show'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, educations_attributes: [:id, :name, :level, :_destory], jobs_attributes: [:id, :position])
  end

end
