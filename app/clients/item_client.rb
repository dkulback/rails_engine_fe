class ItemClient
  def self.get_url(url, query = nil)
    conn = Faraday.new(url: 'http://localhost:3000') do |faraday|
      faraday.params[:query] = query unless query.nil?
    end

    response = conn.get(url)

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_items
    get_url('/api/v1/items')
  end

  def self.get_item(id)
    get_url("/api/v1/items/#{id}")
  end
end
