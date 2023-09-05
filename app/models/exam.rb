class Exam < ApplicationRecord
  has_many :exam_answers
  belongs_to :course_test

  after_create :build_answers

  def build_answers
    questions = self.course_test.test_questions
    questions.each do |question|
      question.exam_answers.create!(right: false, question_option: nil, exam_id: self.id)
    end
  end

  def as_json(_options = nil)
    {
      id: id,
      approved: approved,
      right_answers: right_answers,
      course_test_id: course_test_id,
      exam_answers: exam_answers.as_json
    }
  end
end
