class AddAuthorToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :author, :string
  end
end
