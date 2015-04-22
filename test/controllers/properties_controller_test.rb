require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post :create, property: { address: @property.address, bathrooms: @property.bathrooms, bedrooms: @property.bedrooms, description: @property.description, pets: @property.pets, rent: @property.rent, utilities: @property.utilities }
    end

    assert_redirected_to property_path(assigns(:property))
  end

  test "should show property" do
    get :show, id: @property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property
    assert_response :success
  end

  test "should update property" do
    patch :update, id: @property, property: { address: @property.address, bathrooms: @property.bathrooms, bedrooms: @property.bedrooms, description: @property.description, pets: @property.pets, rent: @property.rent, utilities: @property.utilities }
    assert_redirected_to property_path(assigns(:property))
  end

end
