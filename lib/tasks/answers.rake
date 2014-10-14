namespace :answers do
  desc "Import answers from Twitter"
  task :import => :environment do
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["consumer_key"]
      config.consumer_secret     = ENV["consumer_secret"]
    end
    
    @chatsessions = ChatSession.all
    
    (1..10).each do |i|
      @answers = search_answers(i.to_s)
      @answers.each do |q|
        answer = Answer.new
        answer.topic = q.text
        answer.date = q.created_at
        answer.tweet_id = q.id
        answer.flag = "A"+i.to_s+":"
        answer.author = q.user.screen_name
        answer.author_img = q.user.profile_image_url
        @chatsessions.each do |cs|
          if ChatSession.validrange(cs).include? q.created_at.to_i
            answer.question_id = cs.questions.where('flag LIKE ?', "Q"+i.to_s+"%").first.id
          end
        end
        #answer.question_id = Question.where('flag LIKE ?', "Q"+i.to_s+"%").first.id
        answer.save
      end
    end
  end
  def search_answers(nmbr)
    answers = @client.search("/'a"+nmbr+":/' exclude:retweets #codenewbie", :result_type => "recent")
  end
  
  desc "Delete all answers"
  task :delete => :environment do
    @answers = Answer.all
    @answers.destroy_all
  end
end