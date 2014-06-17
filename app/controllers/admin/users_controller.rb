class Admin::UsersController < ApplicationController
  before_filter :authorized?

  def index

  end

  def create

  end

  def new

  end

  def update

  end
  

  def authorized?
    unless current_user.has_role? :admin
      flash[:error] = "You are not authorized to view that page."
      redirect_to plans_url
    end
  end 
end
