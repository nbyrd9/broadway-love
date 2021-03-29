module ReviewsHelper

    def show_show_name(m, index)
        m.show.name if index
    end

    def show_reviews_path(show)
        show ? show_reviews_path(show) : reviews_path
      end
  
end
