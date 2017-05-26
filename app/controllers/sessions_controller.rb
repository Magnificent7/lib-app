class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        login(user) #set current user and set session id
        redirect_to user_path(user)
    else
      redirect_to "/login"
    end
  end

  def destroy
    logout    # <-- this comes from our SessionsHelper
    redirect_to "/login"
  end
end
