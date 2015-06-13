require 'sinatra'
require 'aws-sdk'
require 'rubygems'
require 'dotenv'
# require 'yelp'
Dotenv.load

def dynamo_client
  Aws::DynamoDB::Client.new(
  region: ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
  )
end

def creds
  {
table_name: "test", # required
  key: { # required
    "hk" => Date.today.to_s, # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
  },
  attribute_updates: {
    params[:choice] => {
      value: 1, # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      action: "ADD" # accepts ADD, PUT, DELETE
    }
  }
}

  # r = Random.new
  #     {
  #     #    table_name: 'test',
  #     #    item: {
  #     #      "hk" => '2015-06-1335'#Date.today.to_s + r.rand(10...42).to_s,
  #     # params[:choice] => params[:choice]
  #     }
    end

# def yelp_request
#   if Yelp.client.configuration.nil?
#     Yelp.client.configure do |config|
#     config.consumer_key = ENV['CONSUMER_KEY']
#     config.consumer_secret = ENV['CONSUMER_SECRET']
#     config.token = ENV['TOKEN']
#     config.token_secret = ENV['TOKEN_SECRET']
#     end
#   end

# Yelp.client.search('Norcross GA', { term: 'food', limit: 5 })
# end

get '/' do
end

get "/vote" do
 response = dynamo_client.update_item(creds).data rescue nil
  resp = dynamo_client.get_item(
  # required
  table_name: "test",
  # required
  key: {
    "hk" => Date.today.to_s 
  })
  resp.data
  result = JSON.parse(resp.to_json)
  result.key
end