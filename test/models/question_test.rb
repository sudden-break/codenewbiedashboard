# == Schema Information
#
# Table name: questions
#
#  id              :integer          not null, primary key
#  date            :datetime
#  topic           :string
#  flag            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  tweet_id        :string
#  chat_session_id :integer
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
