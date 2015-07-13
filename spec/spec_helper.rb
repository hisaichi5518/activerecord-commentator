$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_record'
require 'activerecord/commentator'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:"
)
