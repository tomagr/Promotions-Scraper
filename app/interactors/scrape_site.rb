require 'open-uri'

class ScrapeSite < Interactor

	def self.by(url:)
		scrape_site = new(url: url)
		scrape_site.execute
	end

	def initialize(url:)
		@url = url
	end

	def execute
		scrape_site
	end

	private

	def scrape_site
		doc = Nokogiri::HTML(open(@url))
		entries = doc.css('.blog-post-item')
		save_entries entries unless entries.nil?
	end

	def save_entries entries
		SaveEntries.save(entries: entries)
	end

end
