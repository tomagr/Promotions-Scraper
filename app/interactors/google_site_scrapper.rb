
require 'capybara'
require 'capybara/rails'
require 'capybara/dsl'

require 'google-scraper'

class GoogleSiteScrapper

  def self.scrap
	 engine = GoogleScraper::Engine.new
	 results = engine.query(ARGV[0])

	 results.each do |r|
		puts "#{r.rank} (Position #{r.page_position} for page #{r.page_number})"
		puts r.title
		puts "-> #{r.url}"
		puts r.friendly_url
		puts r.meta_description
		puts ""
	 end
  end


end