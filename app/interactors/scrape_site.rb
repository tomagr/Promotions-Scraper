require 'open-uri'

class ScrapeSite < BaseInteractor

	def self.by(url:)
		new(url: url).execute
	end

	def initialize(url:)
		@url = url
	end

	def execute
		invalid_url @url
		scrape_site
	end

	private

	def scrape_site
		doc = Nokogiri::HTML(URI.open(@url))
		doc.css('.blog-post-item')
	end

end
