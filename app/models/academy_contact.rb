class AcademyContact < ApplicationRecord
  belongs_to :academy

  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true
end
