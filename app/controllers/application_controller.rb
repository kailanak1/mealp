class ApplicationController < ActionController::Base

    before_action :authentication_required
    helper_method :current_user, :logged_in?, :authentication_required, :login_user


  
    def login_user(user)
        session[:user_id] = @user.id
    end
  
    def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end


    def logged_in?
        !!current_user
    end

      
    def authentication_required 
        
        unless logged_in? 
            flash[:messages] = "You must be logged in to view this page."
            redirect_to login_path
        end
    end

    
   



end
