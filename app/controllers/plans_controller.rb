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
    
    # checks params if it matches unlimited
    params[:minute] = Plan.check_unlimited("minute", params[:minute])
    params[:data] = Plan.check_unlimited("data", params[:data])
    params[:text] = Plan.check_unlimited("text", params[:text])
    
    # different queries in database depending on where search originates
    if params[:homesubmit]
      @plans = if params[:price]	 
        Plan.homesearch(user_id, params[:city], params[:price], params[:minute], params[:data], params[:text]).page(params[:page])
      end
    elsif params[:indexsubmit]
      @plans = Plan.with_carrier_search_query(params[:carrier], params[:price], params[:minute], params[:data], params[:text]).page(params[:page])  
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
    
    params[:minute] = Plan.check_unlimited("minute", params[:minute])
    params[:data] = Plan.check_unlimited("data", params[:data])
    params[:text] = Plan.check_unlimited("text", params[:text])
    
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
