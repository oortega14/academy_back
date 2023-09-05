class CourseTest < ApplicationRecord
  belongs_to :course
  has_many :test_questions
  has_many :exams

  def as_json(_options = nil)
    {
      id: id,
      time_limit: time_limit,
      approve_with: approve_with,
      questions: test_questions.as_json
    }
  end
end
