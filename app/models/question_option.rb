class QuestionOption < ApplicationRecord
  belongs_to :test_question
  has_many :exam_answers

  def as_json(_options = nil)
    {
      id: id,
      option_text: option_text
    }
  end
end
