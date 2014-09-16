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

  def self.homesearch(user_id, city_id, price, minute, data, text)
    search = Search.new
    # changes value of params to reflect unlimited before saving to our database
    minute = check_unlimited("minute", minute)
    data = check_unlimited("data", data)
    text = check_unlimited("text", text)
  
    search.city = city_id
    search.price = price
    search.minute = minute
    search.data = data
    search.text = text
    search.user_id = user_id
    
    search.save

    where(city_id: City.where(name:city_id).first.id).where("price <= ?", price).where("minute >= ?", minute).where("data >= ?", data).where("text >= ?", text).order("price ASC")
  end

  def self.check_unlimited(type, amount)
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
