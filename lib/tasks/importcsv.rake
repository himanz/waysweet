require 'csv'

namespace :csv do
	desc "Import CSV data to database"
	task :importcsv => :environment do

		csv_file_path = 'db/data.csv'

		CSV.foreach(csv_file_path) do |row|
			Plan.create!({
				:price => row[0],
				:minute => row[1],
				:data => row[2],
				:text => row[3],	
			})
			puts "Row added!"
		end
	end
end