namespace :scraper do
  desc 'Generate Product Slugs'
  task :entries => :environment do
    Scraper.scrape_by_url 'http://experienciasblack.lanacion.com.ar/'
  end
end
