json.array!(@commercials) do |commercial|
  json.extract! commercial, :id
  json.url commercial_url(commercial, format: :json)
end
