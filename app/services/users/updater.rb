module Users
  class Updater < ApplicationService
    include Params
    attr_reader :user, :params, :section

    def initialize(user, params)
      @user = user
      @params = params
      @section = params[:section]
    end

    def call
      data = if section == 'information'
               information_profile_params
             elsif section == 'profile_picture'
               profile_picture_params
             elsif section == 'account_params'
               account_params
             elsif section == 'privacity'
               privacity_params
             elsif section == 'notifications'
               notification_params
             end
      user.update(data)
      user
    end
  end
end