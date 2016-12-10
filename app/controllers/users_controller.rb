class UsersController < ApplicationController

  def index
  end

  def create_profile
    if params[:user_id] == nil || params[:password] == nil
      render 'register.html.erb'
    else
      @user = User.new(params[:user_id], params[:password], params[:name], params[:address], params[:city], params[:state], params[:zip], params[:country], params[:email])
      session[:user] = @user.to_yaml
      redirect_to "/profile"
    end
  end

  def profile
    @user = YAML.load(session[:user])
    render 'profile.html.erb'
  end

  def register_or_login
    if params[:commit] == "Register"
      redirect_to "/register"
    else #check params against session user params
      if session[:user] == nil
        flash[:alert] = "Please enter a valid username and password"
        redirect_to '/index'
      else @user = YAML.load(session[:user])
        if @user.user_id.upcase == params[:user_id].upcase && @user.password == params[:password]
          redirect_to '/profile'
        elsif @user.user_id.upcase == params[:user_id].upcase && @user.password != params[:password]
          flash[:alert] = "Password incorrect"
          redirect_to '/index'
        else
          flash[:alert] = "Please enter a valid username and password"
          redirect_to '/index'
        end
      end
    end
  end

end
