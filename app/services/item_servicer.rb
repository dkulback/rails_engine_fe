class ItemServicer
  def self.client
    ItemClient
  end

  def self.items
    client.get_items[:data].map do |data|
      Item.new(data)
    end
  end

  def self.item(id)
    Item.new(client.get_item(id)[:data])
  end
end
