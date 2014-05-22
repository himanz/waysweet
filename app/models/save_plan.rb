class SavePlan < ActiveRecord::Base
  validates :price, :data, :minute, :text, :city, :carrier, :presence => true
	belongs_to :plan
	belongs_to :user
end
