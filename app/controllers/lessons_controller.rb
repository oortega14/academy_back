class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[show update destroy]
  def index
    lessons = Lesson.where(course_id: params[:course_id])
    render json: lessons.to_json
  end

  def show
    render json: @lesson.to_json
  end

  def create
    lesson = Lesson.new(lesson_params)
    if lesson.save
      render json: lesson.to_json, status: 200
    else
      render json: { message: 'Error al crear Curso', errors: lesson.errors }, status: 400
    end
  end

  def update
    if @lesson.update(lesson_params)
      render json: @lesson.to_json, status: 200
    else
      render json: { message: 'Error al actualizar la clase', errors: @lesson.errors }, status: 400
    end
  end

  def destroy
    if @lesson.destroy
      render json: { message: 'Clase eliminada exitosametne' }, status: :ok
    else
      render json: { message: 'No se pudo eliminar la clase' }, status: :unprocessable_entity
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title,
      :description,
      :course_id,
      :visible,
      :video,
      archives_attributes: %i[id file archivable_type archivable_id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end
end
