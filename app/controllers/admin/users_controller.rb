class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end
  

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html  {redirect_to admin_users_url, notice: "User was successfully created."}
        format.json { render json: @user, status: :created, location: [:admin,@user] }
      else
        format.html {render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

end


 private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name) 
  end