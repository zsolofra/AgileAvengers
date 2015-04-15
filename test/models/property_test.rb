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

  test "Longitude Not Nill" do
    property = Property.new
    property.address = "11322 21st Ave Chippewa Falls WI, 54729"
    property.save
    assert_not_nil property.longitude, "Longitude is showing as nil"
  end
 test " Latitude Not Nill" do
    property = Property.new
    property.address = "11322 21st Ave Chippewa Falls WI, 54729"
    property.save
    assert_not_nil property.latitude, "Longitude is showing as nil"
 end
  test "full address" do
    p = Property.new
    p.address = "11322 21st Ave"
    p.state = "WI"
    p.city = "Chippewa Falls"
    p.zip = "54729"
    p.save
    address = p.full_address
    assert address = "11322 21st Ave Chippewa Falls WI 54729"
  end

  test "Can't have duplicate address" do
    property = Property.new(:address =>"2804 Fail St")
    property.valid?
    assert property.errors[:address].include?("has already been taken")
  end
end
