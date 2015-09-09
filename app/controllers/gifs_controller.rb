require 'rest-client'

class GifsController < ApplicationController
  API_KEY = "dc6zaTOxFJmzC"
  HOST = "api.giphy.com"
  
  def bieber_gifs
    response = RestClient.get "#{HOST}/v1/gifs/search", {:params => {q: "justin+bieber", limit: 1, 'api_key' => API_KEY}}
    parsed_json = ActiveSupport::JSON.decode(response)
    @url = parsed_json['data'][0]['images']['original']['url']
  end
  
  def funny_gifs
    response = RestClient.get "#{HOST}/v1/gifs/search", {:params => {q: "cats", limit: 1, 'api_key' => API_KEY}}
    parsed_json = ActiveSupport::JSON.decode(response)
    @url = parsed_json['data'][0]['images']['original']['url']
  end
  
end
