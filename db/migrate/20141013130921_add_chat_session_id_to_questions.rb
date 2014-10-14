class AddChatSessionIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :chat_session_id, :integer
  end
end
