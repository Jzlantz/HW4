class UsersController < ApplicationController
  def show
    id = params[:id] # retrieve movie ID from URI route
    @user = User.find(id)
    
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
    begin
      @user = User.create_user!(user_params)
       flash[:notice] = " Welcome, #{@user.user_id}, Your account has been created."
      redirect_to login_path
      
    rescue ActiveRecord::RecordInvalid => invalid
      flash[:notice] = "Sorry, this user-id is taken. Try again."
      redirect_to new_user_path
    end

  end

  def edit
   
  end

  def update
   
  end

  def destroy
      
  end
end
