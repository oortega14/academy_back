class StudentsController < ApplicationController
  def index
    course = Course.find(params[:course_id])
    students = course.students
    render json: students.to_json
  end

  def create
    no_registered = Student.where(course_id: params[:course_id], user_id: current_user.id).blank?
    course_id = params[:course_id]
    student = Student.new(course_id: course_id)
    student.user_id = current_user.id
    if no_registered && student.save!
      render json: student.to_json, status: :ok
    else
      render json: { message: "Error al registrar un estudiante" }, status: :unprocessable_entity
    end
  end

  def destroy
    student = Student.find(params[:id])
    if student.destroy
      render json: { message: "Estudiante eliminado exitosamente" }, status: :ok
    else
      render json: { message: "No se pudo eliminar al estudiante" }, status: :unprocessable_entity
    end
  end

  def my_courses
    students = Student.includes(:course).where(user_id: current_user)
    courses = StudentsFacade.new(students, current_user.id)
    render json: courses.formatter.to_json
  end
end
