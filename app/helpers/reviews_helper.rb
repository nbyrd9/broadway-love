module ReviewsHelper

    def show_show_name(r, index)
        r.show.name if index
    end



    def show_reviews_helper(show)
        show ? show_reviews_path(show) : reviews_path
    end
  
end
