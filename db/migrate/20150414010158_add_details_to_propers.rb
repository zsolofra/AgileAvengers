class AddDetailsToPropers < ActiveRecord::Migration
  def change
    add_column :properties, :city, :string
    add_column :properties, :state, :string
    add_column :properties, :zip, :string
  end
end
