# Be sure to restart your server when you modify this file.
Couple::Application.config.session_store ActionDispatch::Session::CookieStore, expire_after: 7.days, namespace: 'sessions'

Rails.application.config.action_dispatch.cookies_serializer = :json