class ScraperController < ApplicationController

  def list
    #Get available first
    @entries = Entry.all.order('id DESC').limit(20)
  end

  def scrape
    @results = SiteScraper.scrape_by_url Settings.scrapped_site
  end
end
