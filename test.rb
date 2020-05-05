require "tty-prompt"
prompt = TTY::Prompt.new
answer = prompt.select("M or F", %w(Male Female))
puts answer