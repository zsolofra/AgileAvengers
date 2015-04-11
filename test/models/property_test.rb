require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "Creates a valid record" do
    property = Property.new
    property.address = "2804 Boo St"
    property.bedrooms = "2"
    property.bathrooms = "1"
    property.rent = "$1000"
    property.pets = "Yes"
    property.utilities = "Water Included"
    property.description = "This house is right next the a rover. Awesome views."
    assert property.save
  end
  
  test "Address should be required" do
    property = Property.new
    property.address = ""
    property.bedrooms = "2"
    property.bathrooms = "1"
    property.rent = "$1000"
    property.pets = "Yes"
    property.utilities = "Water Included"
    property.description = "This house is right next the a rover. Awesome views."
    assert !property.save
    assert property.errors[:address].include?("can't be blank")
  end
  
  test "Only address is required" do
    property = Property.new
    property.address = "2804 Boo St"
    property.bedrooms = ""
    property.bathrooms = ""
    property.rent = ""
    property.pets = ""
    property.utilities = ""
    property.description = ""
    assert property.save
  end
end
