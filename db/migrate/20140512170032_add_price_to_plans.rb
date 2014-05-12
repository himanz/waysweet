class AddPriceToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :price, :decimal, precision: 5, scale: 2
  end
end
