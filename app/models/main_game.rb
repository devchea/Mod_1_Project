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
    puts `clear`
    acceptance_letter
    puts "You are now entering Hogwarts!"
    empty_line
    level_output
    # prompt = TTY::Prompt.new
    # prompt.select("Hit Enter continue", %w(continue))
    continue
  else
    puts `clear`    #clears the screen
    abort "Goodbye" #exits the program
  end
end

def prompt_questions
  loop do
    logo
    empty_line
    empty_line
    question1
    # random_question
  end
end

def logo
    puts `clear`
    File.readlines("logo.txt").each do |line|
      puts line
    end
end


def acceptance_letter
  File.readlines("letter.txt").each {|line| puts line}
end

def winner_prompt
  puts `clear`
  File.readlines("winner.txt").each {|line| puts line}
  puts "You answered #{$question_count} questions correctly!"
  empty_line
  abort
end

def loser_prompt
    puts `clear`
    File.readlines("loser.txt").each {|line| puts line}
    abort
end

def empty_line
  puts "\n"
end


def continue
    empty_line
    empty_line
    puts "Press Enter To Continue"
    gets
end