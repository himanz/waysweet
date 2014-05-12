class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :feedback
      t.integer :user_id
      t.integer :plan_id

      t.timestamps
    end
  end
end
