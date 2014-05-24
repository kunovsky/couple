require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Couple
  class Application < Rails::Application

    config.time_zone = 'Central Time (US & Canada)'
  
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :en

    config.action_dispatch.perform_deep_munge = false

    # HamlCoffee Assets
    if defined? ::HamlCoffeeAssets
      config.hamlcoffee.namespace = 'window.CPT'
      config.hamlcoffee.name_filter = lambda { |n| n.sub /^client\/templates\//, '' }
    end

    if defined?(ExecJS)
      ExecJS.runtime = ExecJS::Runtimes::Node
    end

    #Compass + Rails 4 Beta Fix
    config.compass.images_dir = '/app/assets/images'
    config.compass.fonts_dir = '/app/assets/fonts'
  end
end