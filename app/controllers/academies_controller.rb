class AcademiesController < ApplicationController
  skip_before_action :authenticate!, only: %i[index show]
  before_action :set_academy, only: %i[show teachers]

  def index
    academies = Academies::Filter.call
    ordered = AcademiesFacade.new(academies)
    render json: ordered.formatter.to_json
  end

  def show
    render json: @academy.to_json
  end

  def create
    academy = Academy.new(academy_params)
    academy.user_id = current_user.id
    academy.build_academy_configuration
    if academy.save!
      render json: academy.to_json, status: 200
    else
      render json: { message: 'Error al crear Academia', errors: academy.errors.full_messages }, status: 400
    end
  end

  def update
    academy = Academies::Updater.call(current_user, params)
    if academy.errors.blank?
      render json: academy.to_json, status: 200
    else
      render json: { message: 'Error al actualizar Academia', errors: academy.errors.full_messages }, status: 400
    end
  end

  def teachers
    courses = Course.where(academy_id: @academy.id).select(:teacher_id).distinct
    teachers = AcademyTeachersFacade.new(courses)
    render json: teachers.formatter.to_json
  end

  private

  def academy_params
    params.require(:academy).permit(:name, :academy_category_id)
  end

  def set_academy
    @academy = Academy.find(params[:id])
  end
end
