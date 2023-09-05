class StudentsFacade
  attr_reader :students, :user_id

  def initialize(students, user_id)
    @user_id = user_id
    @students = students
  end

  def formatter
    data = []
    students.each do |student|
      data << course_format(student.course)
    end
    data
  end

  private

  def course_format(course)
    {
      id: course.id,
      title: course.title,
      subtitle: course.subtitle,
      description: course.description,
      banner: course.banner_url,
      approved: course.approved(user_id)
    }
  end
end
