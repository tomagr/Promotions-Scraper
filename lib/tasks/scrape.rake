namespace :scraper do
  desc 'Scrape Site'
  task :entries => :environment do
    SiteScraper.scrape_by_url 'http://experienciasblack.lanacion.com.ar/'
  end
end
