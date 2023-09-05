class ExamAnswersController < ApplicationController
  before_action :set_exam_answer

  def update
    if @exam_answer.update(exam_answer_params)
      render json: { message: "Respuesta guardada correctamente" }, status: :ok
    else
      render json: { message: "Hubo un problema al guardar tu respuesta" }, status: :unprocessable_entity
    end
  end

  private

  def set_exam_answer
    @exam_answer = ExamAnswer.find(params[:id])
  end

  def exam_answer_params
    params.require(:exam_answer).permit(:question_option_id)
  end
end
