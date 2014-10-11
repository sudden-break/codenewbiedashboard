# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  date       :datetime
#  topic      :string
#  flag       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tweet_id   :string
#

class Question < ActiveRecord::Base
  validates :tweet_id, uniqueness: true
end
