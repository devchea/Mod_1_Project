require 'pry'

$level = 1
$question_count = 0
$prompt = TTY::Prompt.new(active_color: :blue)

def randomID    #generates a random id number for use in formulating questions
    rand(Character.last.id - Character.first.id) + Character.first.id
end

def random_question #generates a random question
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

def level_output    #just outputs all years, your current is highlighted
    array_levels = ["1", "2", "3", "4", "5", "6", "7"]
    array_levels[$level-1] = "*#{$level}*".colorize(:magenta)  #adds the astericks & colorizes current level
    puts "Your current year: #{array_levels.join(" ")}"
    array_levels[$level-1] = "#{$level}"    #removes astericks from the current level
    empty_line
    empty_line
end

def correct     #what happens when your answer is CORRECT
    $level += 1
    $question_count += 1
    empty_line
    correct = "correct".colorize(:green)
    puts "You are #{correct} & move up a year!"
    ($level > 7) ? winner_prompt : end_of_question
end

def wrong(answer)       #what happens when your answer is WRONG
    $level -= 1
    empty_line
    wrong = "wrong".colorize(:red)
    puts "You are #{wrong}."
    puts "The correct answer is: #{answer}"
    empty_line
    puts "You move down a year!"
    ($level == 0) ? loser_prompt : end_of_question
end


def question1 #gender question
    r = randomID
    find_char = Character.find_by(id: r)
    answer = Gender.find_by(id: find_char.gender_id).sex
  
    input = $prompt.select("Is #{find_char.name} a male or female?", %w(male female))
    (input == answer) ? correct : wrong(answer)
end


def question2    #house question
    r = randomID
    find_char = Character.find_by(id: r)
    answer = House.find_by(id: find_char.house_id).name

    input = $prompt.select("What house does #{find_char.name} belong to?", %w(Gryffindor Slytherin HufflePuff Ravenclaw none))
    (input == answer) ? correct : wrong(answer)
end

def question3   #ancestry question
    r = randomID
    find_char = Character.find_by(id: r)
    answer = Ancestry.find_by(id: find_char.ancestry_id).kind

    input = $prompt.select("What is #{find_char.name}'s ancestry?", %w(half-blood muggleborn pure-blood squib none))
    (input == answer) ? correct : wrong(answer)
end

def question4   #actor question
    min = Character.first.id
    max = Character.last.id
    x = (min..max).to_a.sample(4)

    answer = Character.find_by(id: x[0]).actor
    choices = [Character.find_by(id: x[0]).actor, Character.find_by(id: x[1]).actor, Character.find_by(id: x[2]).actor, Character.find_by(id: x[3]).actor].shuffle

    input = $prompt.select("What actor/actress plays #{Character.find_by(id: x[0]).name}?", choices)
    (input == answer) ? correct : wrong(answer)
end

