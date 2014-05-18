json.array!(@attractions) do |attraction|
  json.extract! attraction, :name, :description, :address, :phone, :website, :openning_hours
  json.url attraction_url(attraction, format: :json)
end