json.array!(@clients) do |client|
  json.extract! client, :id, :first_name, :last_name, :bio, :location, :special_notes, :age, :gender, :picture, :goals, :campaign_id
  json.url client_url(client, format: :json)
end
