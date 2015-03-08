json.array!(@missions) do |mission|
  json.extract! mission, :name, :description, :start_date, :end_date, :contact, :country_id, :language_id, :user_id, :active
  json.url mission_url(mission, format: :json)
end