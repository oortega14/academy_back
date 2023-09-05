module Users
  module Params
    extend ActiveSupport::Concern

    included do
      attr_reader :params
    end

    def information_profile_params
      params.require(:user)
            .permit(:first_name,
                    :last_name,
                    :college_degree,
                    :description,
                    social_network_attributes: %i[id
                                                  web_site
                                                  facebook_profile_url
                                                  instagram_profile_url
                                                  linked_in_profile_url
                                                  twitter_profile_url
                                                  youtube_profile_url
                                                  tiktok_profile_url
                                                  academy_id
                                                  user_id])
    end

    def profile_picture_params
      params.require(:user).permit(:profile_picture)
    end

    def account_params
      #TODO Agregar capa de seguridad para cambio de email
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def privacity_params
      params.require(:user).permit(user_configuration_attributes: %i[id public_profile user_id])
    end

    def notification_params
      params.require(:user).permit(user_configuration_attributes: %i[id promotions_email instructors_emails user_id])
    end
  end
end