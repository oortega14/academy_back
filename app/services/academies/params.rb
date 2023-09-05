module Academies
  module Params
    extend ActiveSupport::Concern

    included do
      attr_reader :params
    end

    def academy_configuration_params
      params.require(:academy)
            .permit(:logo,
                    :description,
                    :slogan,
                    academy_configuration_attributes: %i[id academy_id domain colors])
    end
  end
end