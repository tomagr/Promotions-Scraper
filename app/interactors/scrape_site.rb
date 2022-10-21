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
		# doc = Nokogiri::HTML(open(@url))
		doc = Nokogiri::HTML(URI.open(@url))
		xml_entries = doc.css('.blog-post-item')
		save_entries xml_entries unless xml_entries.nil? or xml_entries.empty?
		xml_entries
	end

	def save_entries xml_entries
		SaveEntries.save(xml_entries: xml_entries)
	end

end
