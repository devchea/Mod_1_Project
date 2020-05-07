$name = " "


def welcome #welcome to the game
  logo
  empty_line
  empty_line
  puts "Welcome to the Harry Potter Trivia Game!"
  empty_line
end

def start_game
  prompt = TTY::Prompt.new
  input = prompt.select("Would you like to play the game?", %w(Yes No))
  if input == "Yes"
    empty_line
    get_username
    clear
    acceptance_letter
    puts "Welcome, #{$name}! You are now entering Hogwarts!"
    empty_line
    level_output
    continue
  else
    clear    #clears the screen
    abort "Goodbye" #exits the program
  end
end

def get_username
  puts "What is your name?"
  $name = gets.chomp
end

def prompt_questions
  loop do
    logo
    empty_line
    empty_line
    # question1
    random_question
  end
end

def winner_prompt
  clear
  File.readlines("./Text_Images/winner.txt").each {|line| puts line}
  puts "#{$name}, you answered #{$question_count} questions correctly!"
  empty_line
  abort
end

def loser_prompt
  clear
  File.readlines("./Text_Images/loser.txt").each {|line| puts line}
  abort
end

