namespace :scraper do
  desc 'Scrape Site'
  task :entries => :environment do
		ScrapeSite.by(url: Settings.scrapped_site)
  end
end
