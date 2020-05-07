require_relative './config/environment'
require "tty-prompt"
require 'pry'
require_relative './Game/question.rb'
require_relative './Game/main_game.rb'
require_relative './Game/helper_methods.rb'





def main
  welcome
  start_game
  prompt_questions
end

main





