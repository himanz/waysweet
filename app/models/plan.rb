class Plan < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :comments
  has_many :save_plans, :dependent => :destroy
  has_many :users, :through => :save_plans 

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
end
