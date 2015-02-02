json.array!(@users) do |user|
  json.extract! user, :id, :name, :total_ratign
  json.url user_url(user, format: :json)
end
