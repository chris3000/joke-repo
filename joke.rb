#! /usr/bin/ruby
require 'rubygems'
require 'data_mapper'
require 'json'

class Joke
	include DataMapper::Resource
	
	property :id, Serial #unique id
	property :joke, Text #the joke
	property :rating, Integer #how funny?
	property :created_at, DateTime #when was the joke created?
end