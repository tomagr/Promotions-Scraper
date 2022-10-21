namespace :scraper do

	if Rails.env.development? or Rails.env.test?
		desc 'Run all the report generation tools'
		task :reports do
			puts 'Generating code review output at reports/codereview/overview.html'
			Rake::Task['app:codereview'].invoke

			puts 'Generating code coverage report at reports/coverage/index.html'
			Rake::Task['app:coverage'].invoke
		end
	end
end
