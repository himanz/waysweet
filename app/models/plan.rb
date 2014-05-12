class Plan < ActiveRecord::Base

  def index
    @plan = Plan.new
  end

end
