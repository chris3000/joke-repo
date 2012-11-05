#! /usr/bin/ruby
require 'rubygems'
require 'data_mapper'
require './joke.rb'
DataMapper.setup(:default, {:adapter => 'yaml', :path => '/home/ck987/sinatra/joke-repo/db'})
# Automatically create the tables if they don't exist
DataMapper.auto_upgrade!
# Finish setup
DataMapper.finalize

@joke = Joke.create( :joke => ARGV[0], :rating => Integer(ARGV[1]), :created_at => Time.now )

puts @joke.joke
puts @joke.rating
puts @joke.created_at
exit
