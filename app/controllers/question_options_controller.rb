class QuestionOptionsController < ApplicationController
  before_action :set_option, only: :update
  def index
    test_question = TestQuestion.find(params[:test_question_id])
    question_options = test_question.question_options
    render json: question_options.to_json
  end

  def update
    if @question_option.update(question_options_params)
      render json: @question_option.to_json, status: :ok
    else
      render json: { message: "No se pudo actualizar la respuesta" }, status: :unprocessable_entity
    end
  end

  private

  def set_option
    @question_option = QuestionOption.find(params[:id])
  end

  def question_options_params
    params.require(:question_option).permit(:option_text, :right_answer)
  end
end
