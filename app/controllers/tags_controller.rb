class TagsController < ApplicationController

    def show 
       
        @tag = Tag.find_by(params[:name])
        redirect_to '/search_results'
    end

end
