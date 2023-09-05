class Course < ApplicationRecord
  has_one_attached :banner
  belongs_to :academy
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'
  has_many :lessons
  has_many :students
  has_one :course_test

  def as_json(options = nil)
    {
      id: id,
      title: title,
      subtitle: subtitle,
      price: price,
      description: description,
      stars: stars,
      teacher_id: teacher_id,
      teacher: teacher.full_name,
      academy_id: academy_id,
      academy_name: academy.name,
      banner: banner_url,
      course_test: {
        id: course_test.id,
        approve_with: course_test.approve_with
      }
    }
  end

  def banner_url
    return nil unless self.banner.attached?

    self.banner.url
  end

  def approved(user_id)
    course_test = self.course_test
    exam = Exam.find_by(course_test_id: course_test.id, user_id: user_id)
    return false unless exam.present?

    exam.approved
  end
end
