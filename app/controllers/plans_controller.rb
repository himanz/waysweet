class PlansController < ApplicationController
	def index
      @plans = if params[:search]
        Plan.where("name ILIKE ?", "%#{params[:search]}%")
      else
      Plan.all
    end
  end


#   respond_to do |format|
#     format.js
#     format.html
#   end
# end
  
	def show
		@plan = Plan.find(params[:id])
		@comment = Comment.new
	end

	def new
		@plan = Plan.new
	end

	def create
		city = City.find_by_name(params["plan"]["city_id"])
		if city.nil?	
		  city = City.new
		  city.name = params["plan"]["city_id"]
		  city.save	
		end
    @plan = Plan.new(plan_params)
    @plan.owner_id = current_user.id
    @plan.city_id = city.id
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

  def home
    
  end
  

	private
	def plan_params
		params.require(:plan).permit(:price, :data, :minute, :text, :carrier, :city_id)
	end
  
  

end
