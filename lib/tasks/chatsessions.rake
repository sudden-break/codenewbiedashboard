namespace :chatsessions do
  desc "Add new session"
  task :add => :environment do
    chatsession = ChatSession.new
    chatsession.start_date = DateTime.now
    chatsession.week = DateTime.now.cweek
    chatsession.save
  end
  desc "Delete all sessions"
  task :delete => :environment do
    chatsessions = ChatSession.all
    chatsessions.destroy_all
  end
end