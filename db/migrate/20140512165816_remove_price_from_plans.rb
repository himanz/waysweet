class RemovePriceFromPlans < ActiveRecord::Migration
  def change
    remove_column :plans, :price, :decimal
  end
end
