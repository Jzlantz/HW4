class SessionsController < ApplicationController
    def new 
        
    end
    
    def destroy
        session.clear
        redirect_to movies_path
    end
    
    def create
        user = User.authenticate(session_params)
        if user.nil?
            flash[:notice] = 'Invalid email/password combination'
            redirect_to login_path
        else
        
        session[:session_token] = user.session_token
        flash[:notice] = "Successfully logged in as #{user.user_id}"
        redirect_to movies_path
        end
    end
    
    def session_params
        params.require(:user).permit(:user_id, :email)
    end

end
