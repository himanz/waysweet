class City < ActiveRecord::Base
	# gets geolocation through google maps api when City record is created
	geocoded_by :name
	after_validation :geocode
end
