class MerchantClient
  def self.get_url(url, query = nil)
    conn = Faraday.new(url: 'http://localhost:3000') do |faraday|
      faraday.params[:name] = query unless query.nil?
    end

    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_merchants
    get_url('/api/v1/merchants')
  end

  def self.get_items(id)
    get_url("/api/v1/merchants/#{id}/items")
  end

  def self.get_merchant(id)
    get_url("/api/v1/merchants/#{id}")
  end

  def self.search_merchant(query)
    get_url('/api/v1/merchants/find', query)
  end
end
