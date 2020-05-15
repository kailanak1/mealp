class FriendshipsController < ApplicationController

    def index 
        @friendship = current_user.friendships
    end

    def create 
        @user = current_user 
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
        if !current_user.friends.exists?(@user.id)
            @friendship.save 
            flash[:messages] = "Added friend! :)"
            redirect_to current_user 
        else 
            flash[:messages] = "Unable to add friend :("
        end
    end


    def destroy
        @friendship = current_user.friendships.find(params[:id])
        @friendship.destroy
        flash[:notice] = "Removed friendship."
        redirect_to current_user
      end



end
