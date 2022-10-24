# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  project_name 'Scaper'
  coverage_dir 'reports/coverage'
  track_files '{app,lib}/**/*.rb'

  add_filter '/vendor/'
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/lib/'
  add_filter '/admin/'

  add_filter 'app/channels/application_cable/channel.rb'
  add_filter 'app/channels/application_cable/connection.rb'

  add_filter 'app/jobs/application_job.rb'
  add_filter 'app/models/application_record.rb'

  add_filter 'app/views/layout/mailer.html.erb'
  add_filter 'app/views/layout/mailer.text.erb'

  add_group 'App Factories', '/app/app_factories'
  add_group 'Controllers', '/app/controllers'
  add_group 'Entities', '/app/entities'
  add_group 'Errors', '/app/errors'
  add_group 'Interactors', '/app/interactors'
  add_group 'Mailers', '/app/mailers'
  add_group 'Models', '/app/models'
  add_group 'Services', '/app/services'
  add_group 'Repositories', '/app/repositories'
  add_group 'Serializers', '/app/serializers'
  add_group 'Validators', '/app/validators'

  add_filter 'app/controllers/users'
end if ENV['COVERAGE']

RSpec.configure do |config|
  config.before(:suite) do
    # Rails.application.load_seed # loading seeds
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:each) do
    ## Uncoment to allow remote connections for tests
    # WebMock.allow_net_connect!
  end

  config.after(:suite) do
    FileUtils.rm Rails.root.join('log', 'test.log') if Rails.env.test?
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
