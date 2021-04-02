module ReviewsHelper

    def show_show_name(r, index)
        # byebug
        r.show.name if index
    
    end

    def show_reviews_path(show)
        show ? show_reviews_path(show) : reviews_path
    end
  
end
