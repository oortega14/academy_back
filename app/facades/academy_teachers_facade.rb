class AcademyTeachersFacade
  attr_reader :courses

  def initialize(courses)
    @courses = courses
  end

  def formatter
    data = []
    courses.each do |course|
      data << teacher_format(course)
    end
    data
  end

  private

  def teacher_format(course)
    {
      user_id: course.teacher_id,
      full_name: course.teacher.full_name,
      profile_picture: course.teacher.user_profile_picture_url
    }
  end
end