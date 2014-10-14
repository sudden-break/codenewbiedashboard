class CreateChatSessions < ActiveRecord::Migration
  def change
    create_table :chat_sessions do |t|
      t.string :week
      t.datetime :start_date

      t.timestamps null: false
    end
  end
end
