json.array!(@items) do |item|
  json.extract! item, :id, :description, :price, :purchase_count, :merchant_id, :purchaser_id
  json.url item_url(item, format: :json)
end
