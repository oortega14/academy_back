class Student < ApplicationRecord
  belongs_to :user
  belongs_to :course

  def as_json(_options = nil)
    {
      id: id,
      user_id: user_id,
      user_name: user.full_name
    }
  end
end
