json.array!(@about_studies) do |about_study|
  json.extract! about_study, :heading, :subheading, :description1, :description2, :description3, :interest
  json.url about_study_url(about_study, format: :json)
end