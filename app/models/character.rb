class Character < ActiveRecord::Base
    has_one :actor
    has_one :ancestry
    has_one :gender
    has_one :house
end