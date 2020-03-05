class PostsController < ApplicationController

    before_action :authentication_required

    #Tag feature needs work 

    def index 
        
        # if params[:tag]
        #     @posts = Post.tagged_with(params[:tag])
        # else
        
        @featured_post = Post.all.reverse.first
        @posts = Post.order("created_at desc").limit(10).offset(1)
   
       
        # end 
    end

    def show 
        @post = Post.find(params[:id])
        @user = current_user
    end

    def new 
        @post = Post.new 
    end

    def create
        @post = Post.new(post_params.merge(user: current_user))
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

    def update 
        @post = Post.find(params[:id])
        if @post.valid? 
            @post.update(post_params) 
            redirect_to @post
        else 
            flash[:messages] = @post.errors.full_messages
            render :new 
        end

    end

    def destroy 
        @post = Post.find(params[:id])
        @post.destroy 
        redirect_to posts_path
    end

    

    private 

    def post_params 
        params.require(:post).permit(:title, :summary, :category, :pic, :friend_id, :all_tags, :tag, { tag_ids:[]}, :tag_ids)
    end
end
