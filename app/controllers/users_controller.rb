class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cities = City.all

    if current_user == @user

    else
      redirect_to root_url, :alert => "Please Sign In!"
    end    
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      auto_login(@user)
  		redirect_to plans_url, :notice => "Signed up!"
  	else
  		render :new
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end

end
