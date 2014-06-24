class Admin::DashboardController < ApplicationController

  # before_filter :login_required

  def index

  end

  def show
    @plans = User.all
  end

  
end
