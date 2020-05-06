require_relative './config/environment'
require "tty-prompt"
# $prompt = TTY::Prompt.new
require 'pry'
require_relative './question.rb'
# require_relative './logo.txt'
# require './logo.txt'



def main


    def welcome
        #welcome and rules
        puts "Welcome to the Harry Potter Trivia Game!"
        puts "\n"
        puts "You are now entering Hogwarts!"
        level_output
    end

    def logo
        File.readlines("logo.txt").each do |line|
        puts line
      end
    end


    def prompt_questions 
         loop do
             random_question
              if $level > 3
                  break
              elsif $level <=0
                 break
               end
          end
      end


    end
# binding.pry
main
welcome
logo
# prompt_questions




