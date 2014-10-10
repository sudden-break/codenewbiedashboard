class TwitterController < ApplicationController
  
  def initalize
    
  end
  
  def index
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["consumer_key"]
      config.consumer_secret     = ENV["consumer_secret"]
    end
    @questions = search_questions
  end
  
  def search_questions
    questions = @client.search("#codenewbie a1: exclude:retweets since:2014-10-03", :result_type => "recent")
  end
end
