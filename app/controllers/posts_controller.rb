class PostsController < ApplicationController

    before_action :authentication_required


    def index 
        @posts = Post.all 
    end

    def show 
        @post = Post.find(params[:id])
       
    end

    def new 
        @post = Post.new 
    end

    def create
        @post = Post.new(post_params)
        if @post.valid? 
            @post.save 
            redirect_to @post
        else 
            flash[:messages] = @post.errors.full_messages
            render :new 
        end
    end

    def edit 
        @post = Post.find(params[:id])
    end

    

    private 

    def post_params 
        params.require(:post).permit(:title, :summary, :category, :pic, :user_id, :friend_id)
    end
end
