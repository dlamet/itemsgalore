class ItemParser

  def create_item(keys, values)
    attributes = keys.zip(values).to_h
    merchant = Merchant.find_or_create_from_import(attributes)
    purchaser = Purchaser.find_or_create_from_import(attributes)
    item = Item.find_or_create_from_import(attributes)
    item.merchant = merchant
    item.purchaser = purchaser
    if item.save
      return item
    else
      raise item.errors.to_a[0]
    end
  end

end