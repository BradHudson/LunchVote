require 'sinatra'
require 'dotenv'
Dotenv.load
require './main.rb'
run Sinatra::Application.run!