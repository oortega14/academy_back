module Users
  class Searcher < ApplicationService
    attr_reader :role, :keyword

    def initialize(role, keyword)
      @role = role
      @keyword = keyword
    end

    def call
      users = User.where(role_condition(role))
                  .where(attributes_like_search, keyword: "%#{keyword}%").limit(10)
      users
    end

    private

    def role_condition(role)
      return {} if role.nil?

      { role: role }
    end

    def attributes_like_search
      'first_name LIKE :keyword OR last_name LIKE :keyword OR username LIKE :keyword OR email LIKE :keyword'
    end

  end
end