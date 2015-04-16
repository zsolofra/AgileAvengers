class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :review_id
      t.integer :likes
      t.integer :dislike
      t.text :comment
      t.string :user_id

      t.timestamps null: false
    end
  end
end
