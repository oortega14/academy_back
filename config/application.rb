require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IswoEducation
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.action_dispatch.cookies_same_site_protection = :lax
    config.session_store :cookie_store, key: '_iswo_education_session_id'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options
    # config.middleware.use ActionDispatch::Cookies
    # config.middleware.use ActionDispatch::Session::CookieStore,
    #   key: '_session_id', path: '/', same_site: :None, domain: :all, secure: true

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.i18n.available_locales = %i[es en]
    config.i18n.default_locale = :es
    config.i18n.fallbacks = { es: :en }
    config.api_only = true

    config.generators do |g|
      g.test_framework false
      g.model_specs false
      g.helper_specs false
      g.controller_specs false
    end
  end
end
