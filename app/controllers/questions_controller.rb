class QuestionsController < ApplicationController
  def import
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["consumer_key"]
      config.consumer_secret     = ENV["consumer_secret"]
    end
    (1..10).each do |i|
      @questions = search_questions(i.to_s)
      @questions.each do |q|
        question = Question.new
        question.topic = q.text
        question.date = q.created_at
        question.tweet_id = q.id
        question.flag = q.text[0..2]
        question.save
      end
    end
    redirect_to root_path
  end
  
  def search_questions(nmbr)
    questions = @client.search("from:@codenewbies /'q"+nmbr+":/' exclude:retweets -a1", :result_type => "recent")
  end
  
  def index
    @questions = Question.all
  end
end
