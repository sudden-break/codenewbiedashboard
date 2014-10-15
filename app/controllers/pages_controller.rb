class PagesController < ApplicationController
  def home
    ChatSession.all.each do |cs|
      if cs.questions.count > 0
        @chatsession = cs
      end
    end
  end
end
