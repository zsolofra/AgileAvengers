class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address
      t.string :bedrooms
      t.string :bathrooms
      t.integer :rent, :default => :null
      t.string :pets
      t.string :utilities
      t.text :description

      t.timestamps null: false
    end
  end
end
