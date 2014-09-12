json.array!(@matches) do |match|
  json.extract! match, :id, :status, :winner
  json.url match_url(match, format: :json)
end
