class Admin::DashboardController < ApplicationController

  before_filter :require_login

  def index
  end

  def show
    @plans = User.all
  end

  
end
