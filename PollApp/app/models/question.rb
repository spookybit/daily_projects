# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :text             not null
#  poll_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: "Poll"

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: "AnswerChoice"

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    answers = answer_choices.includes(:responses)
    results_hash = {}
    answers.each do |answer|
      results_hash[answer.text] = answer.responses.length
    end
    results_hash
  end

  def best_results
    q_id = self.id
    Question.find_by_sql(<<-SQL, q_id)
    SELECT
      answer_choices.text, COUNT(*)
    FROM
      answer_choices
      JOIN
        responses
          ON answer_choices.id = responses.answer_id
    GROUP BY
      answer_choices.text
    WHERE
      answer_choices.question_id = ?
      SQL
  end

end
