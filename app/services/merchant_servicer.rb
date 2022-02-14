class MerchantServicer
  def self.client
    MerchantClient
  end

  def self.merchants
    client.get_merchants[:data].map do |data|
      Merchant.new(data)
    end
  end

  def self.merchant(id)
    Merchant.new(client.get_merchant(id)[:data])
  end

  def self.items(id)
    client.get_items(id)[:data].map do |item|
      Item.new(item)
    end
  end
end
