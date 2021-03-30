class ShowsController < ApplicationController
    before_action(:set_show, except: [:index, :new, :create])
    # before_action :authenticate, except: [:create, :new]

    layout "application"
    
    def index
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            @shows = user.shows
        
        else
            @shows = Show.all
        end
    end

    def show 
    end

    def new
        @show = Show.new
        @show.reviews.build(user: current_user)
        @review = @show.reviews.select{|r| r.user_id == current_user }
    end

    def create
        @show = Show.new(show_params)
        @show.reviews.each {|r| r.user = current_user}
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
        @reviews = @show.reviews.where(user_id: current_user.id)
    end

    def update
        if @show.update(show_params)
            redirect_to show_path(@show)
        else
            @reviews = @show.reviews.select{|r| r.user_id == current_user.id }
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
        params.require(:show).permit(:name, :description, 
                                    reviews_attributes: [:rating, :location, :comment, :user_id, :id])
    end

    def set_show
        @show = Show.find_by(id: params[:id])
    end

end
