require 'bundler/setup'
require 'rake'
require 'active_record'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite')
require_all 'lib'
require_all 'app/models'