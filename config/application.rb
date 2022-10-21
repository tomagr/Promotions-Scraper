require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Scraper
	class Application < Rails::Application

		config.load_defaults 6.1

		# Settings in config/environments/* take precedence over those specified here.
		# Application configuration should go into files in config/initializers
		# -- all .rb files in that directory are automatically loaded.
		$last_admin_email_time = Time.now
		config.time_zone = 'America/Argentina/Buenos_Aires'

		config.eager_load_paths += Dir[Rails.root.join('app', 'interactors', '{**/}')]
		config.eager_load_paths += Dir[Rails.root.join('app', 'services', '{**/}')]

		config.autoload_paths << "#{Rails.root}/app/errors"
		config.autoload_paths << "#{Rails.root}/app/validators"
	end
end
