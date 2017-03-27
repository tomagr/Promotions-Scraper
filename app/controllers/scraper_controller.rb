class ScraperController < ApplicationController
  def index
    #Get available first
    @entries = Entry.all.order('status DESC, id DESC').limit(20)
  end

  def scrape_site
    @results = SiteScraper.scrape_by_url "http://experienciasblack.lanacion.com.ar/"
  end
end
