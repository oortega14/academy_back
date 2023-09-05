class TestQuestion < ApplicationRecord
  belongs_to :course_test
  has_many :question_options, dependent: :destroy
  has_many :exam_answers, dependent: :destroy

  def as_json(_options = nil)
    {
      id: id,
      question: question,
      question_options: question_options.as_json
    }
  end
end
