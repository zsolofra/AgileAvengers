json.array!(@reviews) do |review|
  json.extract! review, :id, :property_id, :likes, :dislikes, :user_id, :review
  json.url review_url(review, format: :json)
end
