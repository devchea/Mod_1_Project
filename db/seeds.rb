 require 'net/http'
 require 'open-uri'
 require 'json'
 require 'pry'



 Character.destroy_all
 Gender.destroy_all
 House.destroy_all
 Ancestry.destroy_all

    uri = URI.parse("http://hp-api.herokuapp.com/api/characters")
    response = Net::HTTP.get_response(uri)
    data_hash = JSON.parse(response.body)


    m = Gender.create(sex: "male")
    f = Gender.create(sex: "female")
    temp_gender = " "

    hg = House.create(name: "Gryffindor")
    hs = House.create(name: "Slytherin")
    hh = House.create(name: "Hufflepuff")
    hr = House.create(name: "Ravenclaw")
    hn = House.create(name: "none")
    temp_house = " "

    ah = Ancestry.create(kind: "half-blood")
    ap = Ancestry.create(kind: "pure-blood")
    am = Ancestry.create(kind: "muggleborn")
    as = Ancestry.create(kind: "squib")
    an = Ancestry.create(kind: "none")
    temp_ancestry = " "


    data_hash.each do |c|

        if c["gender"] == "male"
            temp_gender = m.id
        elsif c["gender"] == "female"
            temp_gender = f.id
        end

        if c["house"] == "Gryffindor"
            temp_house = hg.id
        elsif c["house"] == "Slytherin"
            temp_house = hs.id
        elsif c["house"] == "Hufflepuff"
            temp_house = hh.id
        elsif c["house"] == "Ravenclaw"
            temp_house = hr.id
        elsif c["house"] == ""
          temp_house = hn.id
        end

        if c["ancestry"] == "half-blood"
          temp_ancestry = ah.id
        elsif c["ancestry"] == "pure-blood"
          temp_ancestry = ap.id
        elsif c["ancestry"] == "muggleborn"
          temp_ancestry = am.id
        elsif c["ancestry"] == "squib"
          temp_ancestry = as.id
        elsif c["ancestry"] == ""
          temp_ancestry = an.id
        end

        Character.create(name: c["name"], gender_id: temp_gender, house_id: temp_house, ancestry_id: temp_ancestry, actor: c["actor"])


    end




      



