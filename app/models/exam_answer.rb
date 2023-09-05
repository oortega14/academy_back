class ExamAnswer < ApplicationRecord
  belongs_to :exam
  belongs_to :test_question
  belongs_to :question_option, optional: true

  after_update :check_answer, :right_answers_counter

  def check_answer
    right_answer = self.question_option.right_answer
    self.update_column(:right, right_answer)
  end

  def right_answers_counter
    exam = self.exam
    right_answers = exam.exam_answers.where(right: true).count
    exam.update_attribute(:right_answers, right_answers)

    questions_answerered = exam.exam_answers.where.not(question_option: nil).count
    total_questions = exam.course_test.test_questions.count

    return unless questions_answerered == total_questions

    if exam.right_answers >= exam.course_test.approve_with
      exam.update_attribute(:approved, true)
    end
  end

  def as_json(_options = nil)
    {
      id: id,
      test_question_id: test_question_id,
      question_option_id: question_option_id
    }
  end
end
