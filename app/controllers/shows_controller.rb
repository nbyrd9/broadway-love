class ShowsController < ApplicationController

    def index
        if logged_in?
            user = current_user ##check this method
            @shows = user.shows
        else
            @shows = Show.all 
        end
    end

    def show 
    end

    def new
        @show = Show.new
    end

    def create
        @show = Show.new(show_params)
        if @show.save
            flash[:notice] = "Brava! Your show has successfully been submitted." 
            redirect_to show_path(@show)
        else
            redirect_to new_show_path
            @errors = @show.errors.full_messages
            render :new
        end
    end 

    def edit
    end

    def update
        if @show.update(show_params)
            redirect_to show_path(@show)
        else
            @errors = @show.errors.full_messages
            render :edit
        end
    end

    def destroy
        @show.delete
        redirect_to shows_path
    end

    private

    def show_params
        params.require(:show).permit(:name, :description, reviews_attributes: [:rating, :location, :comment]))
    end



end
