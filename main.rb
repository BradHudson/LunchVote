require 'sinatra'
get '/' do
  "Just Do It"
end

post "/vote" do
  @title = params[:title]
  erb :plan_design
end