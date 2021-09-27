require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Portfolio
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    config.generators do |g|
      g.test_framework :rspec,
                      model_specs: true,
                      view_specs: false,
                      helper_specs: false,
                      routing_specs: false,
                      controller_specs: false,
                      request_specs: false
    end
  end
end

config.action_controller.default_protect_from_forgery = false
class ApplicationController < ActionController::Base
  # protect_from_forgery に with オプションを渡さない場合は with: :null_session と同等
  protect_from_forgery
end



