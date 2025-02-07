require 'net/http'
require 'json'

class OmdbService
  BASE_URL = 'http://www.omdbapi.com/'

  def initialize
    @api_key = ENV['OMDB_API_KEY']
  end

  def search_movies(query)
    url = "#{BASE_URL}?s=#{URI.encode_www_form_component(query)}&apikey=#{@api_key}"
    response = Net::HTTP.get(URI(url))
    JSON.parse(response)
  end

  def get_movie_details(imdb_id)
    url = "#{BASE_URL}?i=#{imdb_id}&apikey=#{@api_key}"
    response = Net::HTTP.get(URI(url))
    JSON.parse(response)
  end
end
