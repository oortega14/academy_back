class Lesson < ApplicationRecord
  has_one_attached :video

  has_many :archives, as: :archivable, dependent: :destroy

  belongs_to :course

  accepts_nested_attributes_for :archives

  def as_json(_options = nil)
    {
      id: id,
      title: title,
      description: description,
      visible: visible,
      url_video: url_video,
      files: archives.as_json
    }
  end

  def url_video
    return nil unless self.video.attached?

    self.video.url
  end
end
