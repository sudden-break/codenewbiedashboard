class PagesController < ApplicationController
  def home
    @chatsession = ChatSession.last
  end
end
