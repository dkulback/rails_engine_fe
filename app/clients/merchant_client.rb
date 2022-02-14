class MerchantClient
  def self.get_url(url, query = nil)
    conn = Faraday.new(url: 'http://localhost:3000') do |faraday|
      faraday.params[:query] = query unless query.nil?
    end

    response = conn.get(url)

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_merchants
    get_url('/api/v1/merchants')
  end
end
