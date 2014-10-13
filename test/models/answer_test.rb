# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  date        :datetime
#  topic       :string
#  flag        :string
#  tweet_id    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#  author      :string
#  author_img  :string
#

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
