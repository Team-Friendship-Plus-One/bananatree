json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :title, :deadline_date, :goal, :funded, :current_total, :location
  json.url campaign_url(campaign, format: :json)
end
