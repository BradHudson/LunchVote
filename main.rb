require 'sinatra'
get '/' do
  "Just Do It"
end

post "/plan_design" do
  @title = params[:title]
  erb :plan_design
end