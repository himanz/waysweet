class AddOwneridToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :owner_id, :integer
  end
end
