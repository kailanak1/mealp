class FriendshipsController < ApplicationController

    def index 
        @friendship = current_user.friendships
    end

    def create 
     
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
        if @friendship.save 
            flash[:messages] = "Added friend!"
            redirect_to friendship_path(@friendship)
        else 
            flash[:messages] = "Unable to add friend :("
        end
    end
end
