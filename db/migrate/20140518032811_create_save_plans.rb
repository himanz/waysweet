class CreateSavePlans < ActiveRecord::Migration
  def change
    create_table :save_plans do |t|
      t.integer :user_id
      t.integer :plan_id

      t.timestamps
    end
  end
end
