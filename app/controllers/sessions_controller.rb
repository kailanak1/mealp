class SessionsController < ApplicationController

    #skip_before_action :authentication_required, only [:new, :create]

    def new 
    end

    def create 
        user = User.find_by(name: params[:name])
       
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else 
            flash[:messages] = 'Invalid Login'
            redirect_to login_path
        end
    end

    def destroy 
        reset_session 
        redirect_to login_path
    end
end
