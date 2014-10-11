class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.datetime :date
      t.string :topic
      t.string :flag

      t.timestamps null: false
    end
  end
end
