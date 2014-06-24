class Admin::DashboardController < ApplicationController

  # before_filter :authorize

  def index
    
  end

  def show
    @plans = User.all
  end

  
end
