class UsersController < ApplicationController

  # before_action :authenticate_user!, only: [:show]

  def index
    @users = User.all
  end 

  def new
  end

  def create
    user = User.create(
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      email: params[:email], 
      password: params[:password])
    login(user)  # <-- login the user
    redirect_to user
  end

  def show
    @user = User.find(params[:id])
  end
end
