class AddColumnToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :tweet_id, :string
    add_index :questions, :tweet_id, unique: true
  end
end
