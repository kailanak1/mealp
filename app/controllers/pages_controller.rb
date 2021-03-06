class PagesController < ApplicationController

    def search 
        
        if params[:search].blank?  
          redirect_to(root_path, alert: "Empty field!") and return  
        else  
          @parameter = params[:search].downcase  
          @results = Store.all.where("lower(name) LIKE :search", search: @parameter)  
        end  
      end

    def search_results
        @tag = Tag.find_by(params[:id])
    end
end
