class LibraryUsersController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @libraries = @user.libraries
  end

  def create
    @user = current_user
    @library = Library.find(params[:library_id])
    @library.users.push(@user)

    redirect_to user_libraries_path(@user)
  end
end
