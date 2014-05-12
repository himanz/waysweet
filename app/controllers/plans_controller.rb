class PlansController < ApplicationController
	def index
		@plans = Plan.all
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

	private
	def plan_params
		params.require(:plan).permit(:price, :data, :minute, :text)
	end
end
