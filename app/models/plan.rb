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
