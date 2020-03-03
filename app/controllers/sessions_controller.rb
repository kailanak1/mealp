class SessionsController < ApplicationController

    def new 
    end

    def create 
        #byebug

        user = User.find_by(name: params[:name])
       
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to users_path
        else 
            flash[:messages] = 'Invalid Login'
            redirect_to login_path
        end
        # session[:user_id] = User.find(params[:id]) 
        
        # redirect_to root_path
    end

    def destroy 
        reset_session
        redirect_to login_path
    end
end
