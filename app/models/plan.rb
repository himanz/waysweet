class Plan < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :comments

  def self.average_city_price(cityname)
    allcities = Plan.where(city_id:cityname.id)
    plansum = allcities.to_a.sum(&:price)
    planaverage = plansum / allcities.count
    return planaverage
  end

 
end
