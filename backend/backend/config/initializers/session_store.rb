# if Rails.env === 'production'
#     Rails.application.config.sessions_store :cookie_store, key: '_phase-4-fingers-crossed', domain: '_localhost:3001'
# else
    Rails.application.config.session_store :cookie_store, key: '_phase-4-fingers-crossed'
