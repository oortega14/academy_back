class CoursesController < ApplicationController
  skip_before_action :authenticate!, only: %i[index]
  before_action :set_course, only: %i[show update subscribed]

  def index
    courses = Course.where(academy_id: params[:academy_id])
    render json: courses.to_json
  end

  def show
    render json: @course.to_json
  end

  def create
    course = Course.new(course_params)
    course.build_course_test
    if course.save
      render json: course.to_json, status: 200
    else
      render json: { message: 'Error al crear Curso', errors: course.errors }, status: 400
    end
  end

  def update
    if @course.update(course_params)
      render json: @course.to_json, status: 200
    else
      render json: { message: 'Error al actualizar el curso', errors: course.errors }, status: 400
    end
  end


  def subscribed
    student = Student.find_by(user_id: current_user.id, course_id: @course.id)
    if student.present?
      render json: { subscribed: true, student_id: student.id }, status: :ok
    else
      render json: { subscribed: false, student_id: nil }, status: :ok
    end
  end

  private

  def course_params
    params.require(:course).permit(:title,
                                   :subtitle,
                                   :price,
                                   :description,
                                   :teacher_id,
                                   :academy_id,
                                   :banner)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
