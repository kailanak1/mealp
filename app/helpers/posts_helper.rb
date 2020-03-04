module PostsHelper

    #code provided by Nouran Mahmoud

    def tag_links(tags)
        tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 
    end

end
