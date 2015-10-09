class User < ActiveRecord::Base
    validates_uniqueness_of :user_id
    
    def self.create_user!(user_params)
       
            session_token = SecureRandom.base64
            user_params[:session_token] = session_token
            @user = User.create!(user_params)
    end
    
    def self.authenticate(user_params)
        return find_by(user_id: user_params[:user_id], email: user_params[:email])
    end

end
