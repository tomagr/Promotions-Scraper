namespace :scraper do
  desc 'Scrape Site'
  task :entries => :environment do
    SiteScraper.scrape_by_url Settings.scrapped_site
  end
end
