require 'open-uri'

class ScrapeExperiencias < BaseInteractor

	def self.now
		new.execute
	end

	def execute
		xml_entries = scrape_site
		save_entries xml_entries
	end

	private

	def scrape_site
		ScrapeSite.by(url: url)
	end

	def save_entries xml_entries
		SaveEntries.save(xml_entries: xml_entries)
	end

	def url
		Settings.scrapped_site
	end

end
