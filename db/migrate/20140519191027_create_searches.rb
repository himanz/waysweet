class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :city
      t.decimal :price
      t.integer :minute
      t.integer :data
      t.integer :text
      t.integer :user_id

      t.timestamps
    end
  end
end
