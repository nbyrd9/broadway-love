class SessionsController < ApplicationController

    def new
      @user = User.new
    end
  
    def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_items_path(@user)
      elsif @user
        @errors = ["Invalid Password"]
        render :new
      else
        @errors = ["Invalid Username"]
        render :new
      end
    end
  
  
    # def create_with_fb
    #   user = User.find_or_create_by(username: fb_auth['info']['email']) do |u|
    #     u.password = 'password'
    #   end
    #   if user.save
    #     session[:user_id] = user.id
    #     redirect_to user_items_path(user)
    #   else
    #     redirect_to signup_path
    #   end
    # end
  
    def destroy
      session.clear
      redirect_to '/signup'
    end
  
    private
  
    # def fb_auth
    #    self.request.env['omniauth.auth']
    # end
  
  
  end