class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :userId
      t.integer :propertyId
      t.text_area :review
      t.integer :likes
      t.integer :dislikes

      t.timestamps null: false
    end
  end
end
