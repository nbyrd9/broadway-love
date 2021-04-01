class ReviewsController < ApplicationController
    layout "application"
    before_action :set_review, only: [:edit, :update, :destroy]

    def index 
        if params[:rating]
            @reviews = Review.rating_search(params[:rating])
        else
            @reviews = Review.all
        end
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
        # byebug
        @review = Review.create(review_params)
        @review.user = current_user
        if params[:show_id]
            @review.show_id = params[:show_id]
        end
        if @review.save
            redirect_to shows_path
        else   
            @shows = Show.all
            render :new
        end

    end

    def edit
   
    end


    def update
        if @review.update(review_params)
            redirect_to show_path(@review.show)
        else
            render :edit
        end
    end

    def destroy
        
        @review.destroy
        redirect_to show_path(@review.show)
      end 

    private

    def review_params
        params.require(:review).permit(:rating, :location, :comment, :show_id)
    end

    def set_review
        @review = Review.find_by(id: params[:id])
    end

end
