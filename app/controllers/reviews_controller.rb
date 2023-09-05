class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit destroy]
  def index
    reviews = Review.where(course_id: params[:course])
    render json: reviews.to_json
  end

  def show
    render json: @review.to_json
  end

  def create
    review = Review.new(review_params)
    if can?(:create_review) && review.save
      render json: review.to_json, status: 200
    else
      render json: { message: 'Error al crear reseña', errors: review.errors }, status: 400
    end
  end

  def update
    if can?(:update_review) && review.update(review_params)
      render json: review.to_json, status: 200
    else
      render json: { message: 'Error al actualizar la reseña', errors: review.errors }, status: 400
    end
  end

  def destroy
    if can?(:destroy_review) && review.destroy
      render json: { message: 'Reseña eliminada exitosamente' }, status: 200
    else
      render json: { message: 'No se pudo eliminar la reseña', errors: review.errors }, status: 400
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :stars, :course_id, :user_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
