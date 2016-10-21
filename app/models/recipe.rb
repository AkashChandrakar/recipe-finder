require 'httparty'
class Recipe < ActiveRecord::Base
    include HTTParty
    
    host_port = ENV['FOOD2FORK_SERVER_AND_PORT']||'www.food2fork.com'
    base_uri "http://#{host_port}/api"
    default_params key: ENV['FOOD2FORK_KEY']
    format :json
    
    def self.for(keyword)
        begin
            result=get("/search",query: {q: keyword})["recipes"]
            return result
        rescue Exception => e
            #return an empty hash if result not found or error occured 
            puts e.message
            return Hash.new()
        end
    end

end
