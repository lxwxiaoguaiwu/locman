require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Locman
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.action_cable.disable_request_forgery_protection = true
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :'zh-CN'
    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local
    config.autoload_paths << Rails.root.join('app/policies')
    config.autoload_paths << Rails.root.join('lib')

    ENV['RAILS_ADMIN_THEME'] = 'material'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
