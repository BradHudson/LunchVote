require 'sinatra'
require 'aws-sdk'
require 'rubygems'
require 'dotenv'
require 'yelp'
Dotenv.load

def dynamo_client
  Aws::DynamoDB::Client.new(
  region: ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
  )
end

def creds
  r = Random.new
      {
        table_name: 'test',
        item: {
          "hk" => DateTime.now.to_s + r.rand(10...42).to_s,
    "name" => params[:choice]
  }
      }
    end

def yelp_request
  if Yelp.client.configuration.nil?
    Yelp.client.configure do |config|
    config.consumer_key = ENV['CONSUMER_KEY']
    config.consumer_secret = ENV['CONSUMER_SECRET']
    config.token = ENV['TOKEN']
    config.token_secret = ENV['TOKEN_SECRET']
    end
  end

Yelp.client.search('Norcross GA', { term: 'food', limit: 5 })
end

get '/' do
  yelp_request.businesses[0].name
end

get "/vote" do
  # @place = params[:place]
  # @date = DateTime.now
 response = dynamo_client.put_item(creds).data rescue nil
# resp = dynamo_client.get_item(
#   # required
#   table_name: "test",
#   # required
#   key: {
#     "hk" => "h", #<Hash,Array,String,Numeric,Boolean,nil,IO,Set>,
#   })
#   resp.data
end