namespace :scraper do
	desc 'Scrape Site'
	task :entries => :environment do
		5.times do
			ScrapeExperiencias.now
			sleep(10.seconds)
		end
	end
end
