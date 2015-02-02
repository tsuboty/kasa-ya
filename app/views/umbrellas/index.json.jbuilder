json.array!(@umbrellas) do |umbrella|
  json.extract! umbrella, :id, :gps_lat, :gps_lon, :status
  json.url umbrella_url(umbrella, format: :json)
end
