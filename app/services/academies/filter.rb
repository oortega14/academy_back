module Academies
  class Filter < ApplicationService
    def initialize(params = nil)

    end

    def call
      Academy.all.joins(:academy_category).select('academies.id,
                                                   academies.name,
                                                   academies.description,
                                                   academies.slogan,
                                                   academies.academy_category_id as category_id,
                                                   academy_categories.name as category_name')
    end
  end
end