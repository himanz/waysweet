class Plan < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :comments
  has_many :save_plans, :dependent => :destroy
  has_many :users, :through => :save_plans 
  validates :city_id, presence: true

  def self.average_city_price(carrier)
    allcarriers = Plan.where(carrier:carrier)
    return carrier
  end

  def self.homesearch(city_id, price, minute, data, text)
    search = Search.new
      # changes value of params to reflect unlimited before saving to our database
      if params[:minute] == "1050"
        params[:minute] = "9999"
      end
      if params[:data] == "6500"
        params[:data] = "9999"
      end
      if params[:text] == "2600"
        params[:text] = "9999"
      end
      search.city = params[:city]  
      search.price = params[:price]
      search.minute = params[:minute]
      search.data = params[:data]
      search.text = params[:text]
      if current_user
        search.user_id = current_user.id
      end
      search.save
  end

  def set_unlimited(type, amount)
    if (type == "minute" && amount == "1050") || (type == "data" && amount == "6500") || (type == "text" && amount == "2600")
      return "9999"
    else
      return amount
    end        
  end

  def unlimited(value)
  	if value == 9999
  		return "Unlimited"
  	else
  		return value
  	end
  end 

  def carrier_image(carrier)
    if carrier == "Rogers"
      "rogers.jpg"
    elsif carrier == "Bell"
      "bell.png"
    elsif carrier == "Chatr"
      "chatr.jpg"
    elsif carrier == "Fido"
      "fido.png"
    elsif carrier == "Koodo"
      "koodo.jpg"
    elsif carrier == "Mobilicity"
      "mobilicity.jpg"
    elsif carrier == "Petro Canada"
      "petrocanada.gif"
    elsif carrier == "Public Mobile"
      "publicmobile.gif"
    elsif carrier == "Solo"
      "solo.jpg"
    elsif carrier == "Telus"
      "telus.gif"
    elsif carrier == "Wind"
      "wind.png"
    end
  end
end
