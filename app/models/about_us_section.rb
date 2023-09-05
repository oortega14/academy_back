class AboutUsSection < ApplicationRecord
  belongs_to :academy

  validates :title, presence: true
  validates :description, presence: true

  has_one_attached :picture

  def as_json(_options = nil)
    {
      id: id,
      title: title,
      description: description,
      picture: section_picture
    }
  end

  def section_picture
    return nil unless self.picture.attached?

    self.picture.url
  end
end
