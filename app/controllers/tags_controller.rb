class TagsController < ApplicationController

    def show 
        @tag = Tag.find_by(params[:name])
    end

end
