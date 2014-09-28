Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = true

  # Do not eager load code on boot.
  config.eager_load = true

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.cache_store = :redis_store

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true
    config.action_mailer.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    :enable_starttls_auto => true,
    :user_name => 'tyson@gottman.com',
    :password  => 'R5l5oIf81Bo7vdEqgOcDIA', # SMTP password is any valid API key
    :authentication => 'login',
    :domain => 'coupleanalytics.com', # your domain to identify your server when connecting
  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Debug mode disables concatenation and preprocessing of assets.
  config.assets.debug = false
  config.assets.digest = true

  config.serve_static_assets = false
  config.assets.compile = false

  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  #Use SSL on staging
  config.force_ssl = true

  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.console = true
  end
end
