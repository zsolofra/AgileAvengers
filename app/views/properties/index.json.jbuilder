json.array!(@properties) do |property|
  json.extract! property, :id, :address, :bedrooms, :bathrooms, :rent, :pets, :utilities, :description
  json.url property_url(property, format: :json)
end
