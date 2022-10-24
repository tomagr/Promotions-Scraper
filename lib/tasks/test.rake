# frozen_string_literal: true

namespace :scraper do
  desc 'Run all tests in spec directory'
  task :test do
    Rake::Task['spec'].invoke
  end

  desc 'Generate code coverage report from tests'
  task :coverage do
    ENV['COVERAGE'] = 'YES'
    ENV['SPEC_OPTS'] = '--format progress'
    Rake::Task['spec'].invoke
  end
end
