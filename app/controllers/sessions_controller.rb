class SessionsController < ApplicationController

  layout "sessions"

    def new
      @user = User.new
    end
  
    def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        flash[:notice] = "You have successfully logged in!"
        redirect_to user_shows_path(@user)
      elsif @user
        @errors = ["Invalid Password"]
        render :new
      else
        @errors = ["Invalid Username"]
        render :new
      end
    end
  
    
  
    def google_oauth2
      user = User.find_or_create_by(username: google_auth['info']['email']) do |u|
        u.password = 'password'
      end
      if user.save
        session[:user_id] = user.id
        redirect_to user_shows_path(user)
      else
        redirect_to '/signup'
      end
    end

  
    def destroy
      session.clear
      redirect_to '/signup'
    end
  
    private
  
    def google_auth
       self.request.env['omniauth.auth']
    end
  
  
  end