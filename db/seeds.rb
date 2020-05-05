 require 'net/http'
 require 'open-uri'
 require 'json'
 require 'pry'

Character.destroy_all
Gender.destroy_all
House.destroy_all
Ancestry.destroy_all
Actor.destroy_all

    uri = URI.parse("http://hp-api.herokuapp.com/api/characters")
    response = Net::HTTP.get_response(uri)
    data_hash = JSON.parse(response.body)

    data_hash.each do |c|
      c1 = Character.create(name: c["name"])
      Gender.create(character_id: c1.id, gender: c["gender"])
      House.create(character_id: c1.id, house: c["house"] )
      Ancestry.create(character_id: c1.id, ancestry: c["ancestry"])
      Actor.create(character_id: c1.id, actor: c["actor"])
     end





# response["Countries"].each do |c|
#   c1 = Country.create(name: c["Country"]
#   Case.create(country_id: c1.id, total: c["TotalConfirmed"])

# data_hash.each do |c|
#     c1 = Character.create(name: c["name"])
#     # Species.create(character_id: c1.id, species: c["species"])
#     Gender.create(character_id: c1.id, gender: c["gender"])
#     House.create(character_id: c1.id, house: c["house"])
#     Ancestry.create(character_id: c1.id, ancestry: c["ancestry"])



# class CreateGender < ActiveRecord::Migration[5.2]
#   def change
#     create_table :genders do |t|
#       t.integer :character_id
#       t.string :gender
#     end
#   end
# end


# class CreateCharacters < ActiveRecord::Migration[5.2]
#   def change
#     create_table :characters do |t|
#       t.string :name
#       t.string :species
#       t.string :gender
#       t.string :house
#       t.string :ancestry
#       t.string :actor
#     end
#   end
# end


    # data_hash.each do |char|
    #   Character.create(name: char["name"], species: char["species"], gender: char["gender"], house: char["house"], ancestry: char["ancestry"], actor: char["actor"])
