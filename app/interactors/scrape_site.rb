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
		doc = Nokogiri::HTML(open(@url))
		entries = doc.css('.blog-post-item')
		save_entries entries unless entries.nil?
		entries
	end

	def save_entries entries
		SaveEntries.save(entries: entries)
	end

end
