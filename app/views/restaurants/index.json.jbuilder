json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :telephone, :address, :home_page
  json.url restaurant_url(restaurant, format: :json)
end
