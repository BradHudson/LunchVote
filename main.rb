require 'sinatra'
require 'aws-sdk'
require 'dotenv'
Dotenv.load

def dynamo_client
  Aws::DynamoDB::Client.new(
  region: ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
  )
end

def creds
      {
        table_name: 'test',
        item: {
          "hk" => "g",
    "name" => "joe"
  }
      }
    end

get '/' do
  "Just Do It"
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