class SessionsController < ApplicationController

    def new 
    end

    def create 
        user = User.find_by(:name => params[:name])
        session[:user_id] = User.find(params[:id]) 
        
        redirect_to root_path
    end

    def destroy 
        reset_session
        redirect_login_path
    end
end
