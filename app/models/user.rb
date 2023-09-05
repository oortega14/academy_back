class User < ApplicationRecord
  has_secure_password
  has_one_attached :profile_picture

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 4 }

  enum role: %i[student teacher admin superadmin]

  has_many :exams

  has_one :academy, dependent: :destroy
  has_one :social_network, dependent: :destroy
  has_one :user_configuration, dependent: :destroy

  accepts_nested_attributes_for :social_network
  accepts_nested_attributes_for :user_configuration

  def full_name
    "#{first_name} #{last_name}"
  end

  def as_json(_options = nil)
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      dni: dni,
      role: role,
      college_degree: college_degree,
      description: description,
      profile_picture: user_profile_picture_url,
      user_configuration: {
        id: user_configuration&.id,
        public_profile: user_configuration&.public_profile,
        promotions_email: user_configuration&.promotions_email,
        instructors_emails: user_configuration&.instructors_emails
      },
      social_network: {
        id: social_network&.id,
        web_site: social_network&.web_site,
        facebook_profile_url: social_network&.facebook_profile_url,
        instagram_profile_url: social_network&.instagram_profile_url,
        linked_in_profile_url: social_network&.linked_in_profile_url,
        twitter_profile_url: social_network&.twitter_profile_url,
        youtube_profile_url: social_network&.youtube_profile_url,
        tiktok_profile_url: social_network&.tiktok_profile_url
      },
      academy: {
        id: academy&.id,
        name: academy&.name,
        academy_configuration: {
          id: academy&.academy_configuration&.id,
          colors: academy&.academy_configuration&.colors,
          domain: academy&.academy_configuration&.domain
        }
      }
    }
  end

  def user_profile_picture_url
    return nil unless self.profile_picture.attached?

    self.profile_picture.url
  end
end
