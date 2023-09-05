class ExamsController < ApplicationController
  def index
    exams = current_user.exams
    render json: exams.to_json
  end

  def show
    exam = Exam.find(params[:id])
    render json: exam.to_json
  end

  def create
    course_test = CourseTest.find(params[:course_test_id])
    exam = Exam.create!(course_test_id: course_test.id,
                        user_id: current_user.id,
                        right_answers: 0)
    render json: exam.to_json, status: :ok
  end
end
