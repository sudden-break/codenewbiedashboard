class AddAuthorImageToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :author_img, :string
  end
end
