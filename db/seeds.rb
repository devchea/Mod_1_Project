require 'net/http'
 require 'open-uri'
 require 'json'
 require 'pry'

  def get_data
    uri = URI.parse("http://hp-api.herokuapp.com/api/characters")
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def creating_characters_db
    data_hash = JSON.parse(get_data)
    data_hash.each do |char|
      Character.create(name: char["name"], species: char["species"], gender: char["gender"], house: char["house"], ancestry: char["ancestry"], actor: char["actor"])

     end
  end



Character.destroy_all
creating_characters_db
