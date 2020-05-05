# require_relative '.../config/environment'
# # require 'tty-prompt'
# # ActiveRecord::Base.logger.level = 1
# # prompt = TTY::Prompt.new
# require 'pry'


# # questions = [question1, question2, question3 question4]

# # level = 1 #global variable to show what level the user is on

# def randomID
#   #gets a random id number 
#   x = rand(Character.last.id - Character.first.id) + Character.first.id
#   binding.pry
# end


# def question1
#   #gender 
#   r = randomID
  
#   puts "Is #{characters.name[r]} a male or female?"
#   puts "1 - Male"
#   puts "2 - Female"
#   input = gets.chomp

#   if (input == 1) && (character.gender[r] == "male")
#     correct
#   elsif (input == 2) && (character.gender[r] == "female")
#     correct
#   else
#     wrong
#   end
# end


# def question2
#   #house
#   r = randomID
#   puts "Which house does #{characters.name[r]} belong to"
#   puts "1 - Griffindor"
#   puts "2 - Slytherin"
#   puts "3 - Ravenclaw"
#   puts "4 - Hufflepuff"
#   input = gets.chomp

#   if (input == 1) && (character.house[r] == "Griffindor")
#     correct
#   elsif (input == 2) && (character.house[r] == "Slytherin")
#     correct
#   elsif (input == 3) && (character.house[r] == "Ravenclaw")
#     correct
#   elsif (input == 4) && (character.house[r] == "Hufflepuff")
#     correct
#   else 
#     wrong
#   end
# end

# def question3
#   #ancestry
# end

# def question4
# end


# temp = randomID