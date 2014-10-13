class AnswersController < ApplicationController
  def import
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["consumer_key"]
      config.consumer_secret     = ENV["consumer_secret"]
    end
    (1..10).each do |i|
      @answers = search_answers(i.to_s)
      @answers.each do |q|
        answer = Answer.new
        answer.topic = q.text
        answer.date = q.created_at
        answer.tweet_id = q.id
        answer.flag = "A"+i.to_s+":"
        answer.question_id = Question.where('flag LIKE ?', "Q"+i.to_s+"%").first.id
        answer.author = q.user.screen_name
        answer.author_img = q.user.profile_image_url
        answer.save
      end
    end
    redirect_to root_path
  end
  
  def search_answers(nmbr)
    answers = @client.search("/'a"+nmbr+":/' exclude:retweets #codenewbie", :result_type => "recent")
  end
  
  def destroy
    @answers = Answer.all
    @answers.destroy_all
    redirect_to root_path
  end
end
