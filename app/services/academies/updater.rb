module Academies
  class Updater < ApplicationService
    include Params
    attr_reader :user, :params, :academy

    def initialize(user, params)
      @user = user
      @academy = Academy.find_by!(id: params[:id], user_id: @user.id)
      @params = params
    end

    def call
      academy.update(academy_configuration_params)
      academy
    end
  end
end