class ItemClient
  URL = '/api/v1/items'

  def self.get_url(url, query = nil)
    conn = Faraday.new(url: 'http://localhost:3000') do |faraday|
      faraday.params[:name] = query unless query.nil?
    end

    response = conn.get(url)

    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_items
    get_url(URL)
  end

  def self.get_item(id)
    get_url(URL + "/#{id}")
  end

  def self.search(query)
    get_url(URL + '/find_all', query)
  end
end
