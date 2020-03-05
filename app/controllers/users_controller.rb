class UsersController < ApplicationController
    
    def index 
        @users = User.all 
    end

    def show 
        @user = User.find(params[:id])
        @posts = @user.posts
    end

    def new 
        @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.valid? 
            @user.save 
            redirect_to @user
        else 
            flash[:messages] = @user.errors.full_messages
            render :new 
        end
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])
        if @user.valid? 
            @user.update(user_params) 
            redirect_to @user
        else 
            flash[:messages] = @user.errors.full_messages
            render :new 
        end

    end

    def destroy 
        @user = User.find(session[:user_id])
        @user.destroy 
        redirect_to '/login'
    end

    private 

    def user_params 
        params.require(:user).permit(:name, :password, :friend_id)
    end
end

#add friend_id to user_params
