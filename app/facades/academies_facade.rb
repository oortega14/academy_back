class AcademiesFacade
  attr_reader :academies

  def initialize(academies)
    @academies = academies
  end

  def formatter
    data = []
    academies.each do |academy|
      category_id = academy.category_id
      category = data.select { |k| k[:id] == category_id }.first
      if category.present?
        category[:academies] << academy_attributes(academy)
      else
        data << new_category(academy)
      end
    end
    data
  end

  private

  def new_category(academy)
    {
      id: academy.category_id,
      name: I18n.t("academy_categories.#{academy.category_name}"),
      academies: [ academy_attributes(academy) ]
    }
  end

  def academy_attributes(academy)
    {
      id: academy.id,
      name: academy.name,
      description: academy.description,
      slogan: academy.slogan,
      logo: academy_logo(academy),
      domain: academy.academy_configuration&.domain
    }
  end

  def academy_logo(academy)
    return nil unless academy.logo.attached?

    academy.logo.url
  end
end