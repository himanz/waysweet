require 'csv'

namespace :csv do
	desc "Import CSV data to database"
	task :importcsv => :environment do

		csv_file_path = 'db/data.csv'

		CSV.foreach(csv_file_path) do |row|
			city = City.where(name: row[5]).first

			if city.nil?
				city = City.create(name: row[5])
			end

			Plan.create!({
				:price => row[0],
				:minute => row[1],
				:data => row[2],
				:text => row[3],
				:carrier => row[4],
				:city_id => city.id
			})
			puts "Row added!"
		end
	end
end