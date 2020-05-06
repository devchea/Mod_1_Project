require_relative './config/environment'
require 'tty-prompt'
# # ActiveRecord::Base.logger.level = 1
prompt = TTY::Prompt.new
require 'pry'

$level = 1
$question_count = 0

def randomID    #generates a random id number 
    rand(Character.last.id - Character.first.id) + Character.first.id
end

def level_output    #just outputs all years, your current is highlighted 
    array_levels = ["1", "2", "3", "4", "5", "6", "7"]

    array_levels[$level-1] = "*#{$level}*"
    array_levels[$level-1] = array_levels[$level-1].colorize(:magenta)
    puts "Your current year: #{array_levels.join(" ")}"
    array_levels[$level-1] = "#{$level}"

    empty_line
    empty_line
end


def correct
    $level += 1
    $question_count += 1
    empty_line
    correct = "correct".colorize(:green)
    puts "You are #{correct} & move up a year!"
    if $level > 4
        winner_prompt
    else
      end_of_question
    end
end

def wrong
    $level -= 1
    empty_line
    wrong = "wrong".colorize(:red)
    puts "You are #{wrong} & move down a year!"
    if $level == 0
        loser_prompt
    else
      end_of_question
    end
end

def end_of_question
    empty_line
    level_output
    continue
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

