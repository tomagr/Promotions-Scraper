class ScraperController < ApplicationController
  def index
    @entries = Entry.all
  end

  def scrape_site
    @results = Scraper.scrape_by_url "http://experienciasblack.lanacion.com.ar/"
  end
end
