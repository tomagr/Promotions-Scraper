class ScraperController < ApplicationController

	def list
		#Get available first
		@entries = Entry.all.order('id DESC').limit(20)
	end

	def scrape
		ScrapeSite.by(url: Settings.scrapped_site)
		@results = Entry.where('updated_at <e= ?', DateTime.now + 1.minute)
	end
end
