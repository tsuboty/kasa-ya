json.array!(@ratings) do |rating|
  json.extract! rating, :id, :user_id, :rating
  json.url rating_url(rating, format: :json)
end
