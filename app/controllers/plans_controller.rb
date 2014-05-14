class PlansController < ApplicationController
	def index
		@plans = Plan.order('plans.created_at DESC').page(params[:page])
  
  respond_to do |format|
    format.js
    format.html
  end
end
  
	def show
		@plan = Plan.find(params[:id])
		@comment = Comment.new
	end

	def new
		@plan = Plan.new
	end

	def create
    @plan = Plan.new(plan_params)
    @plan.owner_id = current_user.id
    if @plan.save
    	redirect_to @plan
    else
    	render 'new'
    end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def map
		@plans = Plan.all
		@cities = City.all
	end

	private
	def plan_params
		params.require(:plan).permit(:price, :data, :minute, :text, :carrier, :city)
	end
end
