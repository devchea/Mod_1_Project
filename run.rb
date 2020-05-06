require_relative './config/environment'
require "tty-prompt"
require 'pry'
require_relative './question.rb'
require_relative './app/models/main_game.rb'



def main
  # # String.color_samples  
  # array_levels = ["1", "2", "3", "4", "5", "6", "7"]
  # #  array_levels.map {|level| level.colorize(:white)}
  # array_levels[$level-1] = "*#{$level}*"
  # array_levels[$level-1] = array_levels[$level-1].colorize(:magenta)
  # puts "Your current year: #{array_levels.join(" ")}"
  # array_levels[$level-1] = "#{$level}"
  
# puts "This is light blue with red background".colorize(:light_blue ).colorize( :background => :red)  
# binding.pry

  
  welcome
  start_game
  prompt_questions



end
main





