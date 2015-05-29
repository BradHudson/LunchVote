require 'dotenv'
require 'sinatra'
Dotenv.load
run Sinatra::Application.run!