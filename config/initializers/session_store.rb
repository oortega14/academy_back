if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_iswo_education_session_id', domain: 'iswo-education-json-api'
else
  Rails.application.config.session_store :cookie_store, key: '_iswo_education_session_id', domain: :all, path: '/', secure: true, httponly: false
end