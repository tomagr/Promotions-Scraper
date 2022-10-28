class ScraperController < ApplicationController

	def sample
	end

	def scrape
		ScrapeExperiencias.now
		@results = Entry.where('updated_at <= ?', DateTime.now + 1.minute).limit(10)
	end
end
