class AcademyCategoriesController < ApplicationController
  skip_before_action :authenticate!, only: %i[index]
  def index
    collection = AcademyCategory.all
    render json: collection.to_json
  end
end
