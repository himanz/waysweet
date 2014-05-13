class AddTimeStampsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :updated_at, :datetime
  end
end
