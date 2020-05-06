require_relative './config/environment'
require 'tty-prompt'
# # ActiveRecord::Base.logger.level = 1
prompt = TTY::Prompt.new
require 'pry'


# # questions = [question1, question2, question3 question4]

$level = 1

def randomID    #generates a random id number 
    rand(Character.last.id - Character.first.id) + Character.first.id
end

def level_output
    array_levels = ["1", "2", "3", "4", "5", "6", "7"]
    array_levels[$level-1] = array_levels[$level-1].colorize(:red)
    puts "Your current year: #{array_levels.join("-")}"
    puts "\n"
    # binding.pry
    
end

def correct
    $level += 1
    puts "You are correct & move up one level!"
    # puts "You are now level #{$level}"
    if $level > 3
        puts "You have graduated from Hogwarts! Congrats on completing your journey!"
    else
        level_output
    end
end

def wrong
    $level -= 1
    puts "You are wrong & move down one level!"
    # puts "You are now level #{$level}"
    if $level == 0
        puts "You have lost. Game over!"
    else
      level_output
    end
end

def question1 #gender question
    r = randomID
    find_char = Character.find_by(id: r)
    prompt = TTY::Prompt.new
    input = prompt.select("Is #{find_char.name} a male or female?", %w(male female))

    if (input == "male") && (find_char.gender.gender == "male")
        correct
    elsif (input == "female") && (find_char.gender.gender == "female")
        correct
    else
        wrong
    end
end


def question2    #house question
    r = randomID
    find_char = Character.find_by(id: r)
    if find_char.house.house == ""
        find_char.house.house = "none"
    end

    prompt = TTY::Prompt.new
    input = prompt.select("What house does #{find_char.name} belong to?", %w(Gryffindor Slytherin HufflePuff Ravenclaw none))
    if input == find_char.house.house
        correct
    else
        wrong
    end
end

def question3   #ancestry question
    r = randomID
    find_char = Character.find_by(id: r)
    if find_char.ancestry.ancestry == ""
        find_char.ancestry.ancestry = "none"
    end

    prompt = TTY::Prompt.new
    input = prompt.select("What is #{find_char.name}'s ancestry?", %w(half-blood muggleborn pure-blood squib none))
    # binding.pry
    if input == find_char.ancestry.ancestry
        correct
    else
        wrong
    end
end

def question4   #actor question
    min = Character.first.id
    max = Character.last.id
    x = (min..max).to_a.sample(4)

    correct_ans = Character.find_by(id: x[0]).actor.actor
    choices = [Character.find_by(id: x[0]).actor.actor, Character.find_by(id: x[1]).actor.actor, Character.find_by(id: x[2]).actor.actor, Character.find_by(id: x[3]).actor.actor].shuffle

    prompt = TTY::Prompt.new
    input = prompt.select("What actor/actress plays #{Character.find_by(id: x[0]).name}?", choices)

    if input == correct_ans
       correct
    else
        wrong
    end
end


def random_question
    num = rand(0..3)
    case num
    when 0
        question1
    when 1
        question2
    when 2
        question3
    when 3
        question4
    end
end


# loop do
#     random_question
#     if $level >=3
#         break
#     elsif $level <=0
#         break
#     end
# end

