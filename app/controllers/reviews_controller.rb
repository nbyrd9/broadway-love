class ReviewsController < ApplicationController
    def index 
    end

    def new
        if params[:show_id]
            @show = Show.find_by(id: params[:show_id])
            @review = @show.reviews.build
            @shows = Show.all
        else
            @review = Review.new
            @shows = Show.all
        end
    end

    def create
        @review = Review.create(review_params)
        @review.user = current_user
        if params[:show_id]
            @review.show_id = params[:show_id]
        end
        @review.save
        redirect_to shows_path
    end

    def edit
    end


    def update
    end

    private

    def review_params
        params.require(:review).permit(:show_id, :rating, :location, :comment)
    end

end
