class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :property_id
      t.integer :likes
      t.integer :dislikes
      t.string :user_id
      t.text :review
      t.timestamps null: false
    end
  end
end
