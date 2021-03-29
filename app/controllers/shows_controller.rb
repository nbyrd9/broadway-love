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
        
    end

    def destroy
    end

    private

    def show_params
    end





end
