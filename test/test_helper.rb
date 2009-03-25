require 'rubygems'
require 'active_record'
require "#{File.join(File.dirname(__FILE__), "..", "lib", "find_with_example")}"
require 'test/unit'
require 'active_support'
require 'active_support/test_case'

ActiveRecord::Base.configurations = {'sqlite3' => {:adapter => 'sqlite3', :database => ':memory:'}}
ActiveRecord::Base.establish_connection('sqlite3')
 
ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.logger.level = Logger::DEBUG
 
ActiveRecord::Schema.define(:version => 0) do
  create_table :examples do |t|
    t.string :name
    t.integer :version
  end
end

class Example < ActiveRecord::Base
end