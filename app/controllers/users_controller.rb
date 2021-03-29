class UsersController < ApplicationController

    def new
        @user = User.new
    end


    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_shows_path(@user)
        else
          @errors = @user.errors.full_messages
          render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
