json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :user_id, :umbrella_id, :gps_present_lat, :gps_present_lon
  json.url ticket_url(ticket, format: :json)
end
