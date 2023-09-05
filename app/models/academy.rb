class Academy < ApplicationRecord
  has_one_attached :logo

  has_many :about_us_sections, dependent: :destroy
  has_many :academy_contacts, dependent: :destroy
  has_one :academy_configuration, dependent: :destroy
  belongs_to :academy_category
  belongs_to :user

  accepts_nested_attributes_for :academy_configuration

  def as_json(_options = nil)
    {
      id: id,
      name: name,
      logo: academy_logo,
      user_id: user_id,
      academy_category: academy_category.name,
      description: description,
      slogan: slogan,
      academy_configuration: {
        id: academy_configuration.id,
        colors: academy_configuration.colors,
        domain: academy_configuration.domain
      }
    }
  end

  def academy_logo
    return nil unless self.logo.attached?

    self.logo.url
  end
end
