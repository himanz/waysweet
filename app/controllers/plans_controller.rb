class PlansController < ApplicationController
  before_filter :require_login, only: :new
	def index
		@save_plan = SavePlan.new
    if current_user
      @save_plans = SavePlan.where(user_id: current_user.id)
      user_id = current_user.id
    else
      user_id = nil
    end
    
    # different queries in database depending on where search originates
    if params[:homesubmit]
      @plans = if params[:price]	 
        Plan.homesearch(user_id, params[:city], params[:price], params[:minute], params[:data], params[:text]).page(params[:page])
      end
    elsif params[:indexsubmit]
      if params[:carrier] == "Any"
        @plans = Plan.where("price <= ?", params[:price]).where("minute >= ?", params[:minute]).where("data >= ?", params[:data]).where("text >= ?", params[:text]).order("price ASC").page(params[:page])
      else
    	  @plans = Plan.where("carrier   = ?", params[:carrier]).where("price <= ?", params[:price]).where("minute >= ?", params[:minute]).where("data >= ?", params[:data]).where("text >= ?", params[:text]).order("price ASC").page(params[:page])
    	end
    else
      @plans = Plan.all.page(params[:page])
    end

    respond_to do |format|
      format.html { }
      format.js {}
    end 
  end
  
	def show
		@plan = Plan.find(params[:id])
		@comment = Comment.new
	end

	def new
		@plan = Plan.new
    @city = City.new
	end

	def create
		@plan = Plan.new(plan_params)
    @city = City.find_by_name(params["plan"]["city_id"].downcase.titleize)
		if @city.nil?
		  @city = City.new
		  @city.name = params["plan"]["city_id"].downcase.titleize
		  @city.save	
		end
    
    if params[:minute] == "1050"
        params[:minute] = "9999"
    end
    if params[:data] == "6500"
      params[:data] = "9999"
    end
    if params[:text] == "2600"
      params[:text] = "9999"
    end
    @plan.price = params[:price]
    @plan.minute = params[:minute]
    @plan.data = params[:data]
    @plan.text = params[:text]
    @plan.carrier = params[:plan][:carrier]
    @plan.owner_id = current_user.id
    @plan.city_id = @city.id
    if @plan.save
    	redirect_to plans_path, :notice => "Plan Submitted"
    else
    	render new_plan_path
    end
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
  	@location = request.location.city

  	allcities = City.all
    @cities = []
    allcities.each do |city|
    	@cities.push([city.name,city.name])
    end
    @cities.sort!
  end
  

	private
	def plan_params
		params.require(:plan).permit(:price, :data, :minute, :text, :carrier, :city_id)
	end
  
end
