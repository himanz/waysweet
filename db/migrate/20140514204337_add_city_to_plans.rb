class AddCityToPlans < ActiveRecord::Migration
  def up
		add_column :plans, :city_id, :integer
  end
	def drop
		remove_column :plans, :city_id
	end
end
