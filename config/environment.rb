require 'bundler/setup'
require 'rake'
require 'active_record'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
# require_all 'lib'
require_all 'app/models'