class ArticleScraper

  API_ENDPOINTS = { ruby_flow:  '6xvfa604',
                    hacker_news: 'cq4sa5qy',
                    thought_bot: '5agteaga',
                    reddit: 'dr11r3qw',
                    tech_crunch: 'ay1mv2uu',
                    ruby_corner: '6o2bjwvk'
  }

  def self.fetch_json_for(article_endpoint)
    raise '.fetch_json_for requires a symbol as argument' if article_endpoint.class != Symbol
    response  = JSON(RestClient.get "https://www.kimonolabs.com/api/#{API_ENDPOINTS[article_endpoint]}?apikey=tkXmEDE5rZ4G9HyMPKZWOiuMG7pWCJv3")
    response["results"]["collection1"]
  end

end