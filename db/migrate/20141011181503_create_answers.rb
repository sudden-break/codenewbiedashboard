class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.datetime :date
      t.string :topic
      t.string :flag
      t.string :tweet_id

      t.timestamps null: false
    end
    add_index :answers, :tweet_id, unique: true
  end
end
