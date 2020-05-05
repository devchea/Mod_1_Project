require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)


  x = rand(Character.last.id - Character.first.id) + Character.first.id
  Pry.start
end



