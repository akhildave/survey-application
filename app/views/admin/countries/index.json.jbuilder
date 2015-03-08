json.array!(@countries) do |country|
  json.extract! country, :name, :code
  json.url country_url(country, format: :json)
end