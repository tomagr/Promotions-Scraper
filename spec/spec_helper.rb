#Coverage
require 'simplecov'
SimpleCov.start do
  coverage_dir 'test_output/coverage/'

  add_filter 'app/admin'
  add_filter 'app/controllers/application_controller.rb'
  add_filter 'app/helpers/application_helper.rb'
  add_filter 'app/models/ability.rb'

  add_filter 'bin'
  add_filter 'challenge'
  add_filter 'config'
  add_filter 'db'
  add_filter 'key'
  add_filter 'lib'
  add_filter 'log'
  add_filter 'public'
  add_filter 'reports'
  add_filter 'site-images'
  add_filter 'spec'
  add_filter 'vendor'
  add_filter 'test_output'

  add_group 'Models', '/app/models'
  add_group 'Controllers', '/app/controllers'
  add_group 'Interactors', '/app/interactors'
  add_group 'Serializers', '/app/serializers'
  add_group 'Services', '/app/services'

  # Ignore default files, uncomment if modified
  add_filter 'app/channels/application_cable/channel.rb'
  add_filter 'app/channels/application_cable/connection.rb'

  add_filter 'app/controllers/application_controller.rb'
  add_filter 'app/controllers/api/v1/api_controller.rb'
  add_filter 'app/controllers/concerns/api_handlers.rb'

  add_filter 'app/jobs/application_job.rb'

  add_filter 'app/admin/'

  add_filter 'app/models/application_record.rb'

  add_filter 'app/views/layout/application.html.erb'
  add_filter 'app/mailers/application_mailer.rb'
  add_filter 'app/views/layout/mailer.html.erb'
  add_filter 'app/views/layout/mailer.text.erb'

end

#Testing
require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'rspec/collection_matchers'
require 'shoulda/matchers'
require 'support/factory_girl'
require 'json_matchers/rspec'

RSpec.configure do |config|

  config.include Devise::Test::ControllerHelpers, type: :controller

  config.expect_with :rspec do |expectations|
	 expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
	 mocks.verify_partial_doubles = true
  end


  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  #config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

end

