require_relative './config/environment'
require "tty-prompt"
# $prompt = TTY::Prompt.new

def main


    def welcome
        #welcome and rules
        puts "Welcome to the Harry Potter Trivia Game!"


    end


    def show_current_level

    end



    def prompt_questions 

    end

    def randomID
        #gets a random id number 
        x = rand(Character.last.id - Character.first.id) + Character.first.id
        # binding.pry

    end

    def question1
    #gender 
        r = randomID
        find_character = Character.find_by(id: r)
        char_name = find_character.name
        find_gender = Gender.find_by(character_id: r)
        char_gender = find_gender.gender

        prompt = TTY::Prompt.new
        input = prompt.select("Is #{char_name} a male or female?", %w(male female))

        if (input == "male") && (char_gender == "male")
            puts "correct"
        elsif (input == "female") && (char_gender == "female")
            puts "correct"
        else
            puts "wrong"
        end
    end
end
main
question1