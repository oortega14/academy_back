class AcademyContactsController < ApplicationController
  skip_before_action :authenticate!, only: %i[create]

  def index
    collection = AcademyContact.where(academy_id: params[:academy_id]).order('created_at desc')
    render json: collection.to_json
  end

  def create
    resource = AcademyContact.new(academy_contact_params)
    if resource.save
      render json: { message: 'Mensaje creado correctamente', resource: resource.to_json }, status: :ok
    else
      render json: { message: 'No se pudo crear el mensaje', errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def academy_contact_params
    params.require(:academy_contact).permit(:name, :email, :message, :academy_id)
  end
end
