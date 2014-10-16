class PagesController < ApplicationController
  def home
    ChatSession.all.each do |cs|
      if cs.questions.count > 0
        @chatsession = cs
      end
    end
  end
  
  def test
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["consumer_key"]
      config.consumer_secret     = ENV["consumer_secret"]
    end
    
    @tweets = @client.search("from:@codenewbies exclude:retweets", :result_type => "recent")
    @oembeds = []
    @tweets.each do |t|
      @oembeds << @client.oembed(t)
    end
    #@oembeds << @client.oembed(@tweets.first)
  end
end
