class UsersFacade
  attr_reader :users

  def initialize(users)
    @users = users
  end

  def formatter
    data = []
    users.each do |user|
      data << user_formatter(user)
    end
    data
  end

  private

  def user_formatter(user)
    {
      id: user.id,
      full_name: user.full_name,
      profile_picture: user.user_profile_picture_url
    }
  end

end