class AddCityToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :city_id, :integer
  end
end
