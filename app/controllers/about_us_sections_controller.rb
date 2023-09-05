class AboutUsSectionsController < ApplicationController
  skip_before_action :authenticate!, only: %i[index]
  before_action :set_record, only: %i[update destroy]

  def index
    collection = AboutUsSection.where(academy_id: params[:academy_id])
    render json: collection.to_json
  end

  def create
    record = AboutUsSection.new(record_params)
    if record.save
      render json: record.to_json, status: :ok
    else
      render json: { message: 'Error al crear sección', errors: record.errors.full_messages }, status: 400
    end
  end

  def update
    if @record.update(record_params)
      render json: @record.to_json, status: :ok
    else
      render json: { message: 'Error al actualizar sección', errors: @record.errors.full_messages }, status: 400
    end
  end

  def destroy
    if @record.destroy
      render json: { message: 'Sección eliminada exitosametne' }, status: :ok
    else
      render json: { message: 'No se pudo eliminar la sección' }, status: :unprocessable_entity
    end
  end

  private

  def record_params
    params.require(:about_us_section).permit(:title, :description, :academy_id, :picture)
  end

  def set_record
    @record = AboutUsSection.find(params[:id])
  end
end
