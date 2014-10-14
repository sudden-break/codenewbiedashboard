# == Schema Information
#
# Table name: chat_sessions
#
#  id         :integer          not null, primary key
#  week       :string
#  start_date :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ChatSession < ActiveRecord::Base
  has_many :questions
  
  validates :week, uniqueness: true
end

#cs.start_date = "2014-10-09 00:00:00"
#q = Question.where(:date => [cs.start_date-7.days..cs.start_date+2.days]).first