class TestQuestionsController < ApplicationController
  before_action :set_question, only: %i[update destroy]

  def index
    course_test = CourseTest.find(params[:course_test_id])
    test_questions = course_test.test_questions
    render json: test_questions.to_json
  end

  def create
    test_question = TestQuestion.new(test_question_params)
    (1..4).each do
      test_question.question_options.build
    end
    if test_question.save!
      render json: test_question.to_json, status: :ok
    else
      render json: { message: "No se pudo guardar la pregunta" }, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(test_question_params)
      render json: @question.to_json, status: :ok
    else
      render json: { message: "No se pudo guardar la pregunta" }, status: :unprocessable_entity
    end
  end

  def destroy
    if @question.destroy
      render json: { message: "Pregunta eliminada correctamente" }, status: :ok
    else
      render json: { message: "No se pudo eliminar la pregunta" }, status: :unprocessable_entity
    end
  end

  private

  def set_question
    @question = TestQuestion.find(params[:id])
  end

  def test_question_params
    params.require(:test_question).permit(:question, :course_test_id)
  end
end
