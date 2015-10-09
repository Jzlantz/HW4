class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:user_id, :email)
  end
  
  def index
   @users = User.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @user = User.create!(user_params)
    flash[:notice] = "#{@user.user_id} was successfully created."
    redirect_to movies_path
  end

  def edit
   
  end

  def update
   
  end

  def destroy
      
  end
end
