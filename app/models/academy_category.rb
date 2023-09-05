class AcademyCategory < ApplicationRecord
  has_many :academies

  def as_json(_options = nil)
    {
      id: id,
      name: I18n.t("academy_categories.#{name}")
    }
  end
end
