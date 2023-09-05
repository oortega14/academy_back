class Archive < ApplicationRecord
  has_one_attached :file
  belongs_to :archivable, polymorphic: true

  def as_json(_options = nil)
    {
      id: id,
      file: archive_file
    }
  end

  def archive_file
    return nil unless self.file.attached?

    self.file.url
  end
end
