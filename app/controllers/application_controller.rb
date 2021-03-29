class ApplicationController < ActionController::Base
    helper_method :current_user
    # helper_method :logged_in?

    def current_user
      @current_user = User.find_by(id: session[:user_id])
    end

    # def logged_in?
    #     !!current_user
    # end

    def authenticate
        redirect_to login_path if !current_user
    end

   

end
