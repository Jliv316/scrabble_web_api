class SentenceService
  def initialize(word)
    @word = word
  end

  def sentences
    sentence_info = data[:results][0][:lexicalEntries][0][:sentences]
    sentences_na = sentence_info.map do |info|
      info[:text]
    end
  end

  

 private
 attr_reader :word

  def response
    conn = Faraday.new(:url => "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get do |req|
      req.url "/api/v1/entries/en/mindfulness/sentences?region=gb"
      req.headers['Accept'] = "application/json"
      req.headers['app_id'] = "5e4fdf55"
      req.headers['app_key'] = "0128babb00b82a3039f8a6973c89ecc0"
    end
  end
  
  def data
    json = JSON.parse(response.body, symbolize_names: true)
  end
end