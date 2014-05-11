class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.decimal :price
      t.integer :data
      t.integer :minute
      t.integer :text

      t.timestamps
    end
  end
end
