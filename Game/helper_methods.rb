
def logo
  clear
  File.readlines("./Text_Images/logo.txt").each {|line| puts line}
end

def acceptance_letter
  File.readlines("./Text_Images/letter.txt").each {|line| puts line}
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

def clear
  puts `clear`
end

def end_of_question
  empty_line
  level_output
  continue
end
