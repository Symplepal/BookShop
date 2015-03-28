json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :store_id, :delivery_method, :total_cost
  json.url purchase_url(purchase, format: :json)
end
