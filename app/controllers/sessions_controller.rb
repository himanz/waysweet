class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
      session[:user_id] = user.id
  		redirect_to admin_url, :notice => "Logged in!"
  	else
  		flash.now.alert = "Email or password was invalid"
  		
  	end
  end

  def destroy
  	logout
  	redirect_to plans_url, :alert => "Logged out!"
  end
end
