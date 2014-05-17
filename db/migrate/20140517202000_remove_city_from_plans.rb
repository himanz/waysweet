class RemoveCityFromPlans < ActiveRecord::Migration
  def change
    remove_column :plans, :city, :string
  end
end
