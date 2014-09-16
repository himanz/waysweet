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
    
    # changes value of params to reflect unlimited before saving to our database
    

    search = Search.new(city: city_id, price: price, minute: minute, data: data, text: text, user_id: user_id)
    search.save

    with_city_search_query(city_id, price, minute, data, text)
  end

  def self.with_city_search_query(city_id, price, minute, data, text)
    where(city_id: City.where(name:city_id).first.id).where("price <= ?", price).where("minute >= ?", minute).where("data >= ?", data).where("text >= ?", text).order("price ASC")
  end

  def self.with_carrier_search_query(carrier, price, minute, data, text)
    if carrier == "Any"
      Plan.where("price <= ?", price).where("minute >= ?", minute).where("data >= ?", data).where("text >= ?", text).order("price ASC")
    else
      Plan.where("carrier = ?", carrier).where("price <= ?", price).where("minute >= ?", minute).where("data >= ?", data).where("text >= ?", text).order("price ASC")
    end
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
