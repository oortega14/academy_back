class CourseTestsController < ApplicationController
  before_action :set_course_test

  def show
    render json: @course_test.to_json
  end

  def update
    if @course_test.update(course_test_params)
      render json: { message: "Evaluación actualizada exitosamente" }, status: :ok
    else
      render json: {message: "No se pudo actualizar la evaluación" }, status: :unprocessable_entity
    end
  end

  private

  def set_course_test
    @course_test = CourseTest.find(params[:id])
  end

  def course_test_params
    params.require(:course_test).permit(:time_limit, :approve_with)
  end
end
