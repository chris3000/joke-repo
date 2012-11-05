require 'sinatra'
require 'rubygems'
require 'data_mapper'
require './joke.rb'
DataMapper.setup(:default, {:adapter => 'yaml', :path => '/home/ck987/sinatra/joke-repo/db'})
# Finish setup
DataMapper.finalize

#show all jokes and allow for new joke submission
get '/' do
	@jokes = Joke.all
	#renders views/joke.erb
	#erb allows you to mix ruby with HTML.	
  erb :joke
end

#submit a new joke from webpage
get '/new' do
@joke = Joke.create( :joke => params[:joke], :rating => params[:rating], :created_at => Time.now )
@jokes = Joke.all
 erb :joke
end

#return a random joke as json
get '/api.json' do
content_type :json
jokes = Joke.all
 jokes[rand(jokes.length)].to_json
end

#return a random joke as xml
get '/api.xml' do
content_type :xml
jokes = Joke.all
 jokes[rand(jokes.length)].to_xml
end