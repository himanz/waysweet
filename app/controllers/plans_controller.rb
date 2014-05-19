class PlansController < ApplicationController
	def index
		@save_plan = SavePlan.new
		if params[:city]
			search = Search.new
			search.city= params[:city]
			search.price = params[:price]
      search.minute = params[:minute]
      search.text = params[:text]
      if current_user
      	search.user_id = current_user.id
      end
      search.save      
		end
    @plans = if params[:city]	 
      Plan.where(city_id: City.where(name:params[:city]).first.id).where("price <= ?", params[:price]).where("minute >= ?", params[:minute]).where("data >= ?", params[:data]).where("text >= ?", params[:text])
    else
      Plan.all
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
		@plan = Plan.find(params[:id])
		@plan.destroy
		redirect_to current_user
	end

	def map
		@plans = Plan.all
		@cities = City.all
		@searches = Search.all
	end

  def search
    @plans = Plan.where("price LIKE ?", "%#{params[:search]}%")
    render @plans
  end

  def home
  	allcities = City.all
    @cities = []
    allcities.each do |city|
    	@cities.push(city.name)
    end
    @cities.sort!
  end
  

	private
	def plan_params
		params.require(:plan).permit(:price, :data, :minute, :text, :carrier, :city_id)
	end
  
  

end
