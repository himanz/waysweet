class AddCarrierToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :carrier, :string
  end
end
