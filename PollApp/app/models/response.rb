# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  answer_id   :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Response < ApplicationRecord
  validates :answer_id, presence: true
  validates :user_id, presence: true
  validate :not_duplicate_response

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: "AnswerChoice"

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    !sibling_responses.where(user_id: self.user_id).empty?
  end

  def not_duplicate_response
    if respondent_already_answered?
    # if sibling_responses.all? {|response| response.user_id != self.user_id}
      self.errors[:not_duplicate_response] << "can't have duplicate user_id"
    end
  end
end
